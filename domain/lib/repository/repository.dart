import 'package:domain/entity/attempt_entity.dart';
import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';

abstract class Repository {
  Future<Student> getRandomStudent();
  bool guessTheHouse(String studentId, House house);
  Student getStudentById(String id);
  Stream<List<Attempt>> subscribeToAttemptsList();
  Map<Attempt, Student> getAttemptsMap();
  void reset();
}