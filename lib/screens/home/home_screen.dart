import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../theme/app_colors.dart';
import '../../widgets/announcement_banner.dart';
import '../../widgets/course_progress_tile.dart';
import '../../widgets/section_header.dart';
import '../../widgets/upcoming_assignment_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        children: [
          _Header(),
          const SizedBox(height: 18),
          const SectionHeader(title: 'Tugas Yang Akan Datang'),
          const SizedBox(height: 10),
          UpcomingAssignmentCard(assignment: MockData.upcomingAssignment),
          const SizedBox(height: 18),
          SectionHeader(
            title: 'Pengumuman Terakhir',
            trailing: TextButton(
              onPressed: () {},
              child: const Text('Lihat Semua'),
            ),
          ),
          const SizedBox(height: 8),
          AnnouncementBanner(announcement: MockData.latestAnnouncement),
          const SizedBox(height: 18),
          const SectionHeader(title: 'Progres Kelas'),
          const SizedBox(height: 8),
          ...MockData.courses.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CourseProgressTile(course: c),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo,',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  MockData.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Text(
                  MockData.userRole,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 16,
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
