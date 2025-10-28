// lib/models/game_model.dart
import 'dart:ui';

class GameSession {
  int score;
  int level;
  int correctAnswers;
  int totalAttempts;

  GameSession({
    this.score = 0,
    this.level = 1,
    this.correctAnswers = 0,
    this.totalAttempts = 0,
  });

  void increaseScore(int points) {
    score += points;
    correctAnswers++;
    totalAttempts++;
  }

  void updateLevel() {
    if (correctAnswers >= 5 && level == 1) {
      level = 2;
    } else if (correctAnswers >= 10 && level == 2) {
      level = 3;
    }
  }

  double get accuracy {
    return totalAttempts == 0 ? 0 : (correctAnswers / totalAttempts) * 100;
  }
}

class ColorItem {
  final String name;
  final Color color;

  ColorItem({
    required this.name,
    required this.color,
  });
}

class ShapeItem {
  final String name;
  final String imagePath;

  ShapeItem({
    required this.name,
    required this.imagePath,
  });
}