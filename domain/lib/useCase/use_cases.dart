import 'package:domain/entity/attempt_entity.dart';
import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';
import 'package:domain/repository/repository.dart';

class GetRandomStudentUseCase {
  final Repository _repository;

  GetRandomStudentUseCase(this._repository);

  Future<Student> invoke() => _repository.getRandomStudent();
}

class GuessTheHouseUseCase {
  final Repository _repository;

  GuessTheHouseUseCase(this._repository);

  bool invoke(String studentId, House house) =>
      _repository.guessTheHouse(studentId, house);
}

class GetStudentByIdUseCase {
  final Repository _repository;

  GetStudentByIdUseCase(this._repository);

  Student invoke(String id) => _repository.getStudentById(id);
}

class GetAttemptsMapUseCase {
  final Repository _repository;

  GetAttemptsMapUseCase(this._repository);

  Map<Attempt, Student> invoke() => _repository.getAttemptsMap();
}

class SubscribeToAttemptsUseCase {
  final Repository _repository;

  SubscribeToAttemptsUseCase(this._repository);

  Stream<List<Attempt>> invoke() => _repository.subscribeToAttemptsList();
}

class ResetUseCase {
  final Repository _repository;

  ResetUseCase(this._repository);

  void invoke() => _repository.reset();
}
