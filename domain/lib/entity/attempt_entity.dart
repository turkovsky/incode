class Attempt {
  final int attemptCount;
  final String studentId;
  final bool success;

  Attempt({
    required this.attemptCount,
    required this.studentId,
    required this.success,
  });

  /// to create copy of Attempt with increasing count
  /// (and possibility to set success if it is)
  Attempt increase(bool success) => Attempt(
        attemptCount: attemptCount + 1,
        studentId: studentId,
        success: success,
      );
}
