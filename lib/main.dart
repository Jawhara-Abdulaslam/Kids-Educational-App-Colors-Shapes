// تحديث في lib/main.dart
import 'package:flutter/material.dart';
import 'package:kidcolor/services/text_to_speech_service.dart';
import 'controller/app_rout.dart';
import 'splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // تهيئة خدمة النطق عند بدء التطبيق
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TextToSpeechService().initialize();
    });

    return MaterialApp(
      title: 'العالم الملون',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal',
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}