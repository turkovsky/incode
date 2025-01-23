// ignore: depend_on_referenced_packages
import 'package:data/di/use_case_module.dart';
import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';
import 'package:domain/useCase/use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panda/bloc/base.dart';

part 'home_bloc.freezed.dart';

@freezed
class HomeState extends BlocState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    Student? currentStudent,
    @Default(0) int successAttempts,
    @Default(0) int failedAttempts,
  }) = _HomeState;
}

sealed class HomeAction {
  static HomeAction reset() => _Reset();

  static HomeAction refresh() => _Refresh();

  static HomeAction attempt(House house) => _Attempt(house);
}

class _Reset extends HomeAction {}

class _Refresh extends HomeAction {}

class _TryAgain extends HomeAction {
  final String studentId;

  _TryAgain(this.studentId);
}

class _Attempt extends HomeAction {
  final House house;

  _Attempt(this.house);
}

class HomeBloc extends BaseBloc<HomeAction, HomeState> {
  final GetRandomStudentUseCase _getRandomStudentUseCase =
      UseCaseModule.getItem();
  final GuessTheHouseUseCase _guessTheHouseUseCase = UseCaseModule.getItem();
  final ResetUseCase _resetUseCase = UseCaseModule.getItem();
  final SubscribeToAttemptsUseCase _subscribeToAttemptsUseCase =
      UseCaseModule.getItem();
  final GetStudentByIdUseCase _getStudentByIdUseCase = UseCaseModule.getItem();

  HomeBloc() : super(const HomeState()) {
    _subscribeToAttemptsUseCase.invoke().listen((list) {
      final success = list.where((e) => e.success).length;
      final failed =
          list.map((e) => e.attemptCount).fold(0, (a, b) => a + b) - success;
      emit(state.copyWith(successAttempts: success, failedAttempts: failed));
    });
    getCommunicationStream().listen((action) {
      if (action.runtimeType == ReopenStudent) {
        add(_TryAgain((action as ReopenStudent).studentId));
      }
    });

    on<_Refresh>((event, emit) async {
      final student = await _getRandomStudentUseCase.invoke();
      emit(state.copyWith(currentStudent: student));
    });
    on<_Reset>((event, emit) {
      _resetUseCase.invoke();
      emit(state.copyWith(successAttempts: 0, failedAttempts: 0));
    });
    on<_Attempt>((event, emit) {
      final student = state.currentStudent;
      if (student == null) return;
      _guessTheHouseUseCase.invoke(student.id, event.house);
      add(_Refresh());
    });
    on<_TryAgain>((event, emit) {
      final student = _getStudentByIdUseCase.invoke(event.studentId);
      emit(state.copyWith(currentStudent: student));
    });
    add(_Refresh());
  }
}
