// lib/widgets/settings_widgets/settings_card.dart
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.icon,
    this.iconColor = AppConstants.primaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // أيقونة الإعداد
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),

              const SizedBox(width: 16),

              // نص الإعداد
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // عنصر التحكم
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}