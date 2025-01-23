class Attempt {
  final int attemptCount;
  final String studentId;
  final bool success;

  Attempt({
    required this.attemptCount,
    required this.studentId,
    required this.success,
  });

  Attempt increase(bool success) => Attempt(
        attemptCount: attemptCount + 1,
        studentId: studentId,
        success: success,
      );
}
