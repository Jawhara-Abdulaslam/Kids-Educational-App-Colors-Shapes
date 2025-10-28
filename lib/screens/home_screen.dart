// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/game_button.dart';
import 'colors_screen.dart';
import 'shapes_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text(
          'الوان واشكال',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // شعار التطبيق
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.color_lens,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              Text(
                'الوان',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'تعلم الألوان والأشكال بطريقة ممتعة',
                style: TextStyle(
                  fontSize: 18,
                  color: AppConstants.textColor.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),

              // أزرار الألعاب
              GameButton(
                title: '🎨 تعلم الألوان',
                subtitle: 'تعرف على الألوان المختلفة',
                color: AppConstants.learningColors[0],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ColorsScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              GameButton(
                title: '🔺 تعلم الأشكال',
                subtitle: 'اكتشف الأشكال المتنوعة',
                color: AppConstants.learningColors[2],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShapesScreen(),
                    ),
                  );
                },
              ),

              const Spacer(),

              // معلومات إضافية
              Text(
                'مصمم للأطفال من عمر 3-6 سنوات',
                style: TextStyle(
                  fontSize: 14,
                  color: AppConstants.textColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}