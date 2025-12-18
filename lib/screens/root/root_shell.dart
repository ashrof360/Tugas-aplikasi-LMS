import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../classes/my_classes_screen.dart';
import '../home/home_screen.dart';
import '../notifications/notifications_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  static const routeName = '/app';

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomeScreen(),
      const MyClassesScreen(),
      const NotificationsScreen(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        height: 70,
        backgroundColor: AppColors.primary,
        indicatorColor: Colors.white.withValues(alpha: 0.18),
        selectedIndex: _index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.white),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined, color: Colors.white),
            selectedIcon: Icon(Icons.school, color: Colors.white),
            label: 'Kelas Saya',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            selectedIcon: Icon(Icons.notifications, color: Colors.white),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
