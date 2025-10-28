// lib/services/audio_service.dart
class AudioService {
  bool _soundEnabled = true;

  Future<void> playSound(String soundPath) async {
    if (!_soundEnabled) return;

    try {
      // سيتم تفعيل هذا لاحقاً مع حزمة audioplayers
      print('Playing sound: $soundPath');
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  void setSoundEnabled(bool enabled) {
    _soundEnabled = enabled;
  }

  bool get isSoundEnabled => _soundEnabled;
}