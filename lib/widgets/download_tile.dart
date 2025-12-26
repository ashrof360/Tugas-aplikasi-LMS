import 'package:flutter/material.dart';

import '../models/material_item.dart';
import '../theme/app_colors.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.item});

  final MaterialItem item;

  Widget get _leadingIcon {
    switch (item.type.toLowerCase()) {
      case 'video':
        return const Icon(Icons.play_circle_filled, color: AppColors.primaryDark, size: 32);
      case 'ppt':
        return const Icon(Icons.slideshow, color: AppColors.primaryDark, size: 32);
      default:
        return const Icon(Icons.picture_as_pdf, color: AppColors.primaryDark, size: 32);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.black.withValues(alpha: 0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: ListTile(
          leading: _leadingIcon,
          title: Text(
            item.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            '${item.type} • ${item.sizeLabel}',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: TextButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mengunduh ${item.title}...')),
              );
            },
            icon: const Icon(Icons.file_download_outlined, size: 20, color: AppColors.primaryDark),
            label: const Text(
              'Unduh',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
