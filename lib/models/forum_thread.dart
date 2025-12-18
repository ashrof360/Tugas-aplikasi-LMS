class ForumThread {
  const ForumThread({
    required this.title,
    required this.author,
    required this.lastMessage,
    required this.replies,
  });

  final String title;
  final String author;
  final String lastMessage;
  final int replies;
}
