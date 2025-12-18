import 'package:flutter/material.dart';

import '../models/material_item.dart';
import '../theme/app_colors.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.item});

  final MaterialItem item;

  IconData get _icon {
    switch (item.type.toLowerCase()) {
      case 'video':
        return Icons.play_circle;
      case 'ppt':
        return Icons.slideshow;
      default:
        return Icons.picture_as_pdf;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(_icon, color: AppColors.primaryDark),
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text('${item.type} • ${item.sizeLabel}'),
        trailing: TextButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Download (mock): ${item.title}')),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Unduh'),
        ),
      ),
    );
  }
}
