import 'package:capstone_2026/di/di_setup.dart';
import 'package:capstone_2026/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/routing/router.dart';
import 'ui/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // GoogleSignIn 객체는 전역 싱글톤이므로, getIt에서 가리키는 대상과 같음
  await GoogleSignIn.instance.initialize(
    serverClientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
  );

  diSetup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reservation Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7FAFF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
