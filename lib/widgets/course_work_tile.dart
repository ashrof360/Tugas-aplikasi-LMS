import 'package:flutter/material.dart';

import '../models/course_work.dart';
import '../theme/app_colors.dart';

class CourseWorkTile extends StatelessWidget {
  const CourseWorkTile({super.key, required this.item});

  final CourseWork item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF64B5F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _getTypeLabel(item.type),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  size: 18,
                  color: item.status == CourseWorkStatus.completed
                      ? const Color(0xFF00C853)
                      : Colors.grey.shade400,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _getIcon(item.type),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey.shade200),
            const SizedBox(height: 8),
            Text(
              item.deadline,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTypeLabel(CourseWorkType type) {
    switch (type) {
      case CourseWorkType.quiz:
        return 'QUIZ';
      case CourseWorkType.assignment:
        return 'Tugas';
      case CourseWorkType.meeting:
        return 'Pertemuan 3';
    }
  }

  Widget _getIcon(CourseWorkType type) {
    // Using standard icons for simplicity, roughly matching the image
     switch (type) {
      case CourseWorkType.quiz:
      case CourseWorkType.meeting:
         return const Icon(Icons.quiz_outlined, size: 32,);
      case CourseWorkType.assignment:
         return const Icon(Icons.assignment_outlined, size: 32,);
    }
  }
}
