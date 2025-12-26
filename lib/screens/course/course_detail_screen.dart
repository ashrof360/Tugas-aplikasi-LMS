import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/course.dart';
import '../../theme/app_colors.dart';
import '../../widgets/download_tile.dart';
import '../../widgets/course_work_tile.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            course.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          bottom: const TabBar(
            labelColor: AppColors.primaryDark,
            indicatorColor: AppColors.primaryDark,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              children: [
                Text(
                  'Download Materi Offline',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                ...MockData.materials.map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DownloadTile(item: m),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Catatan',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Fitur offline ini masih berupa layout. Integrasi penyimpanan (misalnya path_provider) dan download manager bisa ditambahkan berikutnya.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              children: [
                ...MockData.courseWorks.map(
                  (w) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CourseWorkTile(item: w),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
