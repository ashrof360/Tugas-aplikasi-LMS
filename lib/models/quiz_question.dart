class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });

  final int id;
  final String text;
  final List<String> options;
  final int correctOptionIndex;
}
