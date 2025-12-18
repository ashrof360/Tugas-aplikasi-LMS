class Course {
  const Course({
    required this.code,
    required this.name,
    required this.term,
    required this.section,
    required this.progress,
    required this.coverLabel,
  });

  final String code;
  final String name;
  final String term;
  final String section;
  final double progress; // 0..1
  final String coverLabel;
}
