// تحديث في lib/widgets/shape_card.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ShapeCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final String category;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ShapeCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.category,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // أيقونة الشكل
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.3), width: 2),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(icon, size: 32, color: color),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Icon(
                      Icons.volume_up,
                      color: color.withOpacity(0.7),
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // معلومات الشكل
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.textColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 10,
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppConstants.textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // أيقونة الصوت
            Icon(
              Icons.volume_up,
              color: AppConstants.primaryColor.withOpacity(0.6),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}