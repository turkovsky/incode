import 'package:data/di/use_case_module.dart';
import 'package:domain/entity/attempt_entity.dart';
import 'package:domain/entity/student_entity.dart';
import 'package:domain/useCase/use_cases.dart';
import 'package:panda/bloc/base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_bloc.freezed.dart';

@freezed
class ListState extends BlocState with _$ListState {
  const factory ListState({
    @Default(false) bool isLoading,
    @Default(0) int successAttempts,
    @Default(0) int failedAttempts,
    @Default('') String filterQuery,
    @Default({}) Map<Attempt, Student> attempts,
    @Default([]) List<AttemptItem> items,
  }) = _ListState;
}

class AttemptItem {
  final String studentId;
  final String studentName;
  final String image;
  final int attempts;
  final bool isSuccess;

  AttemptItem({
    required this.studentId,
    required this.studentName,
    required this.image,
    required this.attempts,
    required this.isSuccess,
  });
}

sealed class ListAction {
  static ListAction reset() => _Reset();

  static ListAction filter(String query) => _Filter(query);

  static ListAction tryAgain(String studentId) => _TryAgain(studentId);
}

class _Reset extends ListAction {}

class _Filter extends ListAction {
  final String query;

  _Filter(this.query);
}

class _Init extends ListAction {}

class _TryAgain extends ListAction {
  final String studentId;

  _TryAgain(this.studentId);
}

class ListBloc extends BaseBloc<ListAction, ListState> {
  final ResetUseCase _resetUseCase = UseCaseModule.getItem();
  final GetAttemptsMapUseCase _getAttemptsMapUseCase = UseCaseModule.getItem();
  final SubscribeToAttemptsUseCase _subscribeToAttemptsUseCase =
      UseCaseModule.getItem();

  ListBloc() : super(const ListState()) {
    _subscribeToAttemptsUseCase.invoke().listen((list) {
      add(_Init());
    });

    on<_Init>((event, emit) {
      final map = _getAttemptsMapUseCase.invoke();
      final list = convertToList(map, state.filterQuery);
      final success = map.keys.where((e) => e.success).length;
      final failed =
          map.keys.map((e) => e.attemptCount).fold(0, (a, b) => a + b) -
              success;
      emit(state.copyWith(
        attempts: map,
        items: list,
        successAttempts: success,
        failedAttempts: failed,
      ));
    });
    on<_Reset>((event, emit) {
      _resetUseCase.invoke();
      emit(state.copyWith(successAttempts: 0, failedAttempts: 0));
    });
    on<_Filter>((event, emit) {
      final list = convertToList(state.attempts, event.query);
      emit(state.copyWith(items: list, filterQuery: event.query));
    });
    on<_TryAgain>((event, emit) {
      sendCommunicationAction(ReopenStudent(event.studentId));
    });
    add(_Init());
  }

  List<AttemptItem> convertToList(
      Map<Attempt, Student> attempts, String query) {
    return attempts.entries
        .map((entry) => AttemptItem(
              studentId: entry.value.id,
              studentName: entry.value.name,
              image: entry.value.image,
              attempts: entry.key.attemptCount,
              isSuccess: entry.key.success,
            ))
        .where((item) =>
            query.isEmpty ||
            item.studentName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
