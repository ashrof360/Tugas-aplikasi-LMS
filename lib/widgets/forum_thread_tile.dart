import 'package:flutter/material.dart';

import '../models/forum_thread.dart';
import '../theme/app_colors.dart';

class ForumThreadTile extends StatelessWidget {
  const ForumThreadTile({super.key, required this.thread});

  final ForumThread thread;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.forum, color: AppColors.primaryDark),
        ),
        title: Text(
          thread.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        subtitle: Text('${thread.author} • ${thread.lastMessage}'),
        trailing: Chip(
          label: Text('${thread.replies}'),
          side: const BorderSide(color: AppColors.line),
          backgroundColor: Colors.white,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Buka thread (mock): ${thread.title}')),
          );
        },
      ),
    );
  }
}
