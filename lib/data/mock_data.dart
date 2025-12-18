import '../models/announcement.dart';
import '../models/assignment.dart';
import '../models/course.dart';
import '../models/forum_thread.dart';
import '../models/material_item.dart';
import '../models/schedule_item.dart';

class MockData {
  static const String userName = 'DANDY CANDRA PRATAMA';
  static const String userRole = 'MAHASISWA';

  static const upcomingAssignment = Assignment(
    courseName: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
    title: 'Tugas 01 – UID Android Mobile Game',
    deadlineLabel: 'Jumat 26 Februari, 23:59 WIB',
  );

  static const latestAnnouncement = Announcement(
    title: 'Maintenance Pra UAS Semester Genap 2020/2021',
    subtitle: 'Info Maintenance Server',
  );

  static const courses = <Course>[
    Course(
      term: '2021/2',
      name: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      code: 'D4SM-42-03',
      section: '[ADY]',
      progress: 0.89,
      coverLabel: 'UI/UX',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'KEWARGANEGARAAN',
      code: 'D4SM-41-GABI',
      section: '[BBO]. JUMAT 2',
      progress: 0.86,
      coverLabel: 'CIV',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'SISTEM OPERASI',
      code: 'D4SM-44-02',
      section: '[DDS]',
      progress: 0.90,
      coverLabel: 'OS',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      code: 'D4SM-41-GABI',
      section: '[APJ]',
      progress: 0.90,
      coverLabel: 'MOB',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'BAHASA INGGRIS: BUSINESS DAN SCIENTIFIC',
      code: 'D4SM-41-GABI',
      section: '[ARS]',
      progress: 0.90,
      coverLabel: 'ENG',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      code: 'D4SM-43-04',
      section: '[TPR]',
      progress: 0.90,
      coverLabel: 'PMI',
      startDate: 'Monday, 8 February 2021',
    ),
    Course(
      term: '2021/2',
      name: 'OLAH RAGA',
      code: 'D3TT-44-02',
      section: '[EYR]',
      progress: 0.90,
      coverLabel: 'OR',
      startDate: 'Monday, 8 February 2021',
    ),
  ];

  static const courseSchedule = <ScheduleItem>[
    ScheduleItem(
      day: 'Senin',
      time: '08:00 - 09:40',
      room: 'R. 3.12',
      topic: 'Pertemuan Mingguan / Teori',
    ),
    ScheduleItem(
      day: 'Rabu',
      time: '13:00 - 15:30',
      room: 'Lab. Multimedia',
      topic: 'Praktikum & Tugas',
    ),
  ];

  static const materials = <MaterialItem>[
    MaterialItem(
      title: 'Modul 01 – Pengenalan',
      type: 'PDF',
      sizeLabel: '1.2 MB',
    ),
    MaterialItem(
      title: 'Video – Implementasi UI',
      type: 'Video',
      sizeLabel: '120 MB',
    ),
    MaterialItem(title: 'Slide – Minggu 02', type: 'PPT', sizeLabel: '4.6 MB'),
  ];

  static const forumThreads = <ForumThread>[
    ForumThread(
      title: 'Tanya: Format Pengumpulan Tugas 01',
      author: 'Dosen',
      lastMessage: 'Pastikan sertakan link repo dan screenshot hasil.',
      replies: 12,
    ),
    ForumThread(
      title: 'Diskusi: Best Practice UI untuk Mobile Game',
      author: 'Mahasiswa',
      lastMessage: 'Ada referensi UI kit yang bagus?',
      replies: 8,
    ),
  ];
}
