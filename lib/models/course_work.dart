enum CourseWorkType { quiz, assignment, meeting }

enum CourseWorkStatus { completed, pending, check }

class CourseWork {
  const CourseWork({
    required this.title,
    required this.deadline,
    required this.type,
    required this.status,
  });

  final String title;
  final String deadline;
  final CourseWorkType type;
  final CourseWorkStatus status;
}
