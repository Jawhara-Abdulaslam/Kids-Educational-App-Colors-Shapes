// تحديث في lib/widgets/color_button.dart
import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String name;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  const ColorButton({
    super.key,
    required this.color,
    required this.name,
    required this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.color_lens,
                    color: color,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // مؤشر النطق
            Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.volume_up,
                color: Colors.white.withOpacity(0.8),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}