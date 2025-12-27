import 'package:flutter/material.dart';

import '../models/material_item.dart';
import '../theme/app_colors.dart';

class DownloadTile extends StatefulWidget {
  const DownloadTile({super.key, required this.item});

  final MaterialItem item;

  @override
  State<DownloadTile> createState() => _DownloadTileState();
}

class _DownloadTileState extends State<DownloadTile> {
  bool _isDownloading = false;
  double _progress = 0;

  void _startDownload() async {
    setState(() {
      _isDownloading = true;
      _progress = 0;
    });

    // Simulate download progress
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      setState(() {
        _progress = i / 10;
      });
    }

    setState(() {
      _isDownloading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil mengunduh ${widget.item.title}'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Widget get _leadingIcon {
    switch (widget.item.type.toLowerCase()) {
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
            widget.item.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.item.type} • ${widget.item.sizeLabel}',
                style: const TextStyle(fontSize: 12),
              ),
              if (_isDownloading) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
                    minHeight: 4,
                  ),
                ),
              ],
            ],
          ),
          trailing: _isDownloading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
                  ),
                )
              : TextButton.icon(
                  onPressed: _startDownload,
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
