import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';
import 'screens/root/root_shell.dart';
import 'screens/splash/splash_screen.dart';
import 'theme/app_theme.dart';

class LmsApp extends StatelessWidget {
  const LmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLOE LMS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RootShell.routeName: (_) => const RootShell(),
      },
    );
  }
}
