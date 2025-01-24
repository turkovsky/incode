import 'package:data/mapper/student_mapper.dart';
import 'package:data/repository/api_data_source.dart';
import 'package:data/repository/local_data_source.dart';
import 'package:data/repository/repository.dart';
import 'package:domain/repository/repository.dart';
import 'package:domain/useCase/use_cases.dart';
import 'package:get_it/get_it.dart';

part 'repository_module.dart';

class UseCaseModule {
  static bool _isInit = false;
  static UseCaseModule? __instance;

  static UseCaseModule get _instance {
    __instance ??= UseCaseModule._();
    return __instance!;
  }

  UseCaseModule._() {
    if (!_isInit) _init();
  }

  final GetIt _getIt = GetIt.instance;

  void _init() {
    _isInit = true;
    _getIt.registerSingleton<GetRandomStudentUseCase>(
        GetRandomStudentUseCase(_RepositoryModule.getItem()));
    _getIt.registerSingleton<GuessTheHouseUseCase>(
        GuessTheHouseUseCase(_RepositoryModule.getItem()));
    _getIt.registerSingleton<GetStudentByIdUseCase>(
        GetStudentByIdUseCase(_RepositoryModule.getItem()));
    _getIt.registerSingleton<GetAttemptsMapUseCase>(
        GetAttemptsMapUseCase(_RepositoryModule.getItem()));
    _getIt.registerSingleton<ResetUseCase>(
        ResetUseCase(_RepositoryModule.getItem()));
    _getIt.registerSingleton<SubscribeToAttemptsUseCase>(
        SubscribeToAttemptsUseCase(_RepositoryModule.getItem()));
  }

  static T getItem<T extends Object>() => _instance._getIt.get<T>();
}
