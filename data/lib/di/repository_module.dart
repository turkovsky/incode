part of 'use_case_module.dart';

class _RepositoryModule {
  static bool _isInit = false;
  static _RepositoryModule? __instance;

  static _RepositoryModule get _instance {
    __instance ??= _RepositoryModule._();
    return __instance!;
  }

  _RepositoryModule._() {
    if (!_isInit) _init();
  }

  final GetIt _getIt = GetIt.instance;

  void _init() {
    _isInit = true;
    _initRepository();
  }

  void _initRepository() {
    _getIt.registerSingleton<ApiDataSource>(ApiDataSource(StudentMapper()));
    _getIt.registerSingleton<LocalDataSource>(LocalDataSource());
    _getIt.registerSingleton<Repository>(RepositoryImpl(getItem(), getItem()));
  }

  static T getItem<T extends Object>() => _instance._getIt.get<T>();

}