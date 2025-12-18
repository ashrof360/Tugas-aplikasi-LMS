import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/course.dart';
import '../../theme/app_colors.dart';
import '../../widgets/download_tile.dart';
import '../../widgets/forum_thread_tile.dart';
import '../../widgets/schedule_tile.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Tab(text: 'Kalender'),
              Tab(text: 'Forum'),
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
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Catatan',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Fitur offline ini masih berupa layout. Integrasi penyimpanan (misalnya path_provider) dan download manager bisa ditambahkan berikutnya.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.muted),
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
                Text(
                  'Kalender Akademik (Jadwal Mingguan)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                ...MockData.courseSchedule.map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ScheduleTile(item: s),
                  ),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              children: [
                Text(
                  'Forum Diskusi',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Tulis pertanyaan / topik diskusi…',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Posting (mock) dikirim.'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.send,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...MockData.forumThreads.map(
                  (t) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ForumThreadTile(thread: t),
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
