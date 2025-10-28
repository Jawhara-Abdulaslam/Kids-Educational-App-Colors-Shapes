// lib/services/text_to_speech_service.dart
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _ttsEnabled = true;
  bool _isInitialized = false;

  Future<void> initialize() async {
    try {
      // التحقق من اللغات المتاحة
      List<dynamic> languages = await _flutterTts.getLanguages;
      print('اللغات المتاحة: $languages');

      // ضبط إعدادات النطق للغة العربية
      await _flutterTts.setLanguage("ar-SA"); // العربية السعودية
      await _flutterTts.setSpeechRate(0.4); // أبطأ للعربية
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);

      // إعدادات إضافية مهمة للعربية
      await _flutterTts.setQueueMode(1);

      _isInitialized = true;
      print('تم تهيئة خدمة النطق بنجاح');

    } catch (e) {
      print('خطأ في تهيئة النطق: $e');

      // محاولة استخدام لغة افتراضية إذا فشلت العربية
      try {
        await _flutterTts.setLanguage("en-US");
        await _flutterTts.setSpeechRate(0.5);
        _isInitialized = true;
        print('تم استخدام اللغة الإنجليزية كبديل');
      } catch (e2) {
        print('فشل التهيئة تماماً: $e2');
      }
    }
  }

  Future<void> speak(String text) async {
    if (!_ttsEnabled || !_isInitialized) {
      print('النطق غير مفعل أو غير مهيأ');
      return;
    }

    try {
      print('جاري نطق: $text');

      // التوقف عن أي نطق سابق
      await _flutterTts.stop();

      // النطق بالنص الجديد
      await _flutterTts.speak(text);

    } catch (e) {
      print('خطأ في النطق: $e');

      // محاولة إعادة التهيئة إذا فشل النطق
      if (!_isInitialized) {
        await initialize();
        if (_isInitialized) {
          await _flutterTts.speak(text);
        }
      }
    }
  }

  Future<void> stop() async {
    try {
      await _flutterTts.stop();
    } catch (e) {
      print('خطأ في إيقاف النطق: $e');
    }
  }

  void setTtsEnabled(bool enabled) {
    _ttsEnabled = enabled;
  }

  bool get isInitialized => _isInitialized;
}

// // lib/services/text_to_speech_service.dart
// import 'package:flutter_tts/flutter_tts.dart';
//
// class TextToSpeechService {
//   static final TextToSpeechService _instance = TextToSpeechService._internal();
//   factory TextToSpeechService() => _instance;
//   TextToSpeechService._internal();
//
//   final FlutterTts _flutterTts = FlutterTts();
//   bool _isTtsEnabled = true;
//
//   // تهيئة خدمة النطق
//   Future<void> initialize() async {
//     await _flutterTts.setLanguage("ar-SA"); // اللغة العربية - السعودية
//     await _flutterTts.setSpeechRate(0.5); // سرعة النطق متوسطة
//     await _flutterTts.setPitch(1.0); // درجة الصوت طبيعية
//     await _flutterTts.setVolume(1.0); // أعلى حجم
//   }
//
//   // دالة لنطق النص
//   Future<void> speak(String text) async {
//     if (!_isTtsEnabled || text.isEmpty) return;
//
//     try {
//       await _flutterTts.speak(text);
//     } catch (e) {
//       print('Error in text-to-speech: $e');
//     }
//   }
//
//   // إيقاف النطق
//   Future<void> stop() async {
//     await _flutterTts.stop();
//   }
//
//   // تفعيل/تعطيل النطق
//   void setTtsEnabled(bool enabled) {
//     _isTtsEnabled = enabled;
//     if (!enabled) {
//       stop();
//     }
//   }
//
//   // التحقق من حالة النطق
//   bool get isTtsEnabled => _isTtsEnabled;
//
//   // الحصول على اللغات المتاحة
//   Future<List<dynamic>> getAvailableLanguages() async {
//     return await _flutterTts.getLanguages;
//   }
//
//   // تغيير إعدادات النطق
//   Future<void> setTtsSettings({
//     double? rate,
//     double? pitch,
//     double? volume,
//     String? language,
//   }) async {
//     if (rate != null) await _flutterTts.setSpeechRate(rate);
//     if (pitch != null) await _flutterTts.setPitch(pitch);
//     if (volume != null) await _flutterTts.setVolume(volume);
//     if (language != null) await _flutterTts.setLanguage(language);
//   }
// }