import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../course/course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        children: [
          Text(
            'Kelas Saya',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          ...(List.of(MockData.courses)
            ..sort((a, b) => a.name.compareTo(b.name)))
            .map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  leading: _CourseIcon(
                    label: c.coverLabel,
                    imageUrl: c.imageUrl,
                  ),
                  title: Text(
                    c.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('${c.term} • ${c.code} ${c.section}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CourseDetailScreen(course: c),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseIcon extends StatelessWidget {
  const _CourseIcon({required this.label, this.imageUrl});

  final String label;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: imageUrl == null ? AppColors.primary.withValues(alpha: 0.12) : null,
        borderRadius: BorderRadius.circular(14),
        image: imageUrl != null ? DecorationImage(
          image: AssetImage(imageUrl!),
          fit: BoxFit.cover,
        ) : null,
      ),
      child: imageUrl == null ? Center(
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: AppColors.primaryDark,
          ),
        ),
      ) : null,
    );
  }
}
