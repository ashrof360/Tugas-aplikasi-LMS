import 'package:flutter/material.dart';
import '../../models/course_work.dart';
import '../../theme/app_colors.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key, required this.item});

  final CourseWork item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF64B5F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Tugas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.deadline,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Instruksi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item.description.isNotEmpty 
                ? item.description 
                : 'Tidak ada instruksi khusus untuk tugas ini.',
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Lampiran',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Panduan_Tugas_01.pdf',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Icon(Icons.download, color: Colors.grey.shade400),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Status Pengumpulan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  item.status == CourseWorkStatus.completed 
                    ? Icons.check_circle 
                    : Icons.pending_actions,
                  color: item.status == CourseWorkStatus.completed 
                    ? const Color(0xFF00C853) 
                    : Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  item.status == CourseWorkStatus.completed 
                    ? 'Sudah Dikumpulkan' 
                    : 'Belum Dikumpulkan',
                  style: TextStyle(
                    fontSize: 14,
                    color: item.status == CourseWorkStatus.completed 
                      ? const Color(0xFF00C853) 
                      : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: item.status == CourseWorkStatus.completed ? null : () {
                  // TODO: Implement submission logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  item.status == CourseWorkStatus.completed 
                    ? 'Tugas Telah Dikumpulkan' 
                    : 'Kumpulkan Tugas',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
