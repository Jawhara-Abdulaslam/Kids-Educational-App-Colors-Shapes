// lib/services/settings_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  static const String _keyBackgroundMusic = 'background_music';
  static const String _keySoundEffects = 'sound_effects';
  static const String _keyVibration = 'vibration';
  static const String _keyDifficulty = 'difficulty';
  static const String _keyTextSize = 'text_size';
  static const String _keyLanguage = 'language';

  Future<void> saveSoundSettings({
    required bool backgroundMusic,
    required bool soundEffects,
    required bool vibration,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyBackgroundMusic, backgroundMusic);
    await prefs.setBool(_keySoundEffects, soundEffects);
    await prefs.setBool(_keyVibration, vibration);
  }

  Future<Map<String, bool>> getSoundSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'backgroundMusic': prefs.getBool(_keyBackgroundMusic) ?? true,
      'soundEffects': prefs.getBool(_keySoundEffects) ?? true,
      'vibration': prefs.getBool(_keyVibration) ?? true,
    };
  }

  Future<void> saveDifficulty(String difficulty) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyDifficulty, difficulty);
  }

  Future<String> getDifficulty() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyDifficulty) ?? 'easy';
  }

  Future<void> saveTextSize(int size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyTextSize, size);
  }

  Future<int> getTextSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyTextSize) ?? 1;
  }

  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, language);
  }

  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage) ?? 'ar';
  }

  Future<void> clearAllSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyBackgroundMusic);
    await prefs.remove(_keySoundEffects);
    await prefs.remove(_keyVibration);
    await prefs.remove(_keyDifficulty);
    await prefs.remove(_keyTextSize);
    await prefs.remove(_keyLanguage);
  }

  // تحديث في lib/services/settings_service.dart
// إضافة مفاتيح جديدة للنطق
  static const String _keyTtsEnabled = 'tts_enabled';
  static const String _keyTtsRate = 'tts_rate';
  static const String _keyTtsPitch = 'tts_pitch';

// دالة لحفظ إعدادات النطق
  Future<void> saveTtsSettings({
    required bool ttsEnabled,
    required double ttsRate,
    required double ttsPitch,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyTtsEnabled, ttsEnabled);
    await prefs.setDouble(_keyTtsRate, ttsRate);
    await prefs.setDouble(_keyTtsPitch, ttsPitch);
  }

// دالة لقراءة إعدادات النطق
  Future<Map<String, dynamic>> getTtsSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'ttsEnabled': prefs.getBool(_keyTtsEnabled) ?? true,
      'ttsRate': prefs.getDouble(_keyTtsRate) ?? 0.5,
      'ttsPitch': prefs.getDouble(_keyTtsPitch) ?? 1.0,
    };
  }
}