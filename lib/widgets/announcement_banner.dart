import 'package:flutter/material.dart';

import '../models/announcement.dart';
import '../theme/app_colors.dart';

class AnnouncementBanner extends StatelessWidget {
  const AnnouncementBanner({super.key, required this.announcement});

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement.subtitle,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: AppColors.muted),
            ),
            const SizedBox(height: 6),
            Text(
              announcement.title,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.15),
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      bottom: -10,
                      child: Icon(
                        Icons.construction,
                        size: 120,
                        color: AppColors.primary.withValues(alpha: 0.25),
                      ),
                    ),
                    const Positioned(
                      left: 14,
                      top: 14,
                      child: Row(
                        children: [
                          Icon(Icons.info, color: AppColors.primaryDark),
                          SizedBox(width: 8),
                          Text(
                            'Maintenance LMS',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 14,
                      top: 44,
                      right: 14,
                      child: Text(
                        'Akses LMS mungkin tidak stabil selama maintenance.\nMohon simpan pekerjaan Anda.',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: AppColors.muted),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
