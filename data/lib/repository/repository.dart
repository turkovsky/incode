import 'dart:math';

import 'package:data/repository/api_data_source.dart';
import 'package:data/repository/local_data_source.dart';
import 'package:domain/entity/attempt_entity.dart';
import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';
import 'package:domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final ApiDataSource _apiDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(this._apiDataSource, this._localDataSource) {
    _init();
  }

  Future _init() async {
    final list = await _apiDataSource.getStudentsList();
    _localDataSource.storeStudents(list);
  }

  @override
  Future<Student> getRandomStudent() async {
    final list = _localDataSource.getStudents();
    if (list.isEmpty) list.addAll(await _apiDataSource.getStudentsList());
    final index = Random().nextInt(list.length);
    return list[index];
  }

  @override
  Student getStudentById(String id) {
    final list = _localDataSource.getStudents();
    return list.firstWhere((e) => e.id == id);
  }

  @override
  bool guessTheHouse(String studentId, House house) {
    return _localDataSource.addAttempt(studentId, house);
  }

  @override
  Stream<List<Attempt>> subscribeToAttemptsList() {
    return _localDataSource.attemptsStream;
  }

  @override
  Map<Attempt, Student> getAttemptsMap() {
    final list = _localDataSource.getStudents();
    final attempts = _localDataSource.getAttempts();
    final Map<Attempt, Student> map = {};

    void addToMap(Attempt attempt) {
      final student = list.firstWhere((e) => e.id == attempt.studentId);
      map[attempt] = student;
    }
    attempts.forEach(addToMap);
    return map;
  }

  @override
  void reset() {
    _localDataSource.reset();
  }
}
