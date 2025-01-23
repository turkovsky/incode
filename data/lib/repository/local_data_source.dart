import 'dart:async';

import 'package:domain/entity/attempt_entity.dart';
import 'package:domain/entity/house.dart';
import 'package:domain/entity/student_entity.dart';

class LocalDataSource {
  final List<Student> _students = [];
  final Set<Attempt> _attempts = {};
  final StreamController<List<Attempt>> _controller = StreamController.broadcast();
  Stream<List<Attempt>> get attemptsStream => _controller.stream;

  void storeStudents(List<Student> students) {
    _students.clear();
    _students.addAll(students);
  }

  List<Student> getStudents() => _students;

  bool addAttempt(String studentId, House house) {
    final student = _students.firstWhere((e) => e.id == studentId);
    final success = student.house == house;
    final attempt = _attempts.firstWhere((e) => e.studentId == studentId,
        orElse: () => Attempt(
              attemptCount: 0,
              studentId: studentId,
              success: success,
            ));
    _attempts.remove(attempt);
    _attempts.add(attempt.increase(success));
    _controller.add(_attempts.toList());

    return student.house == house;
  }

  List<Attempt> getAttempts() => _attempts.toList();

  void reset() {
    _attempts.clear();
    _controller.add([]);
  }
}
