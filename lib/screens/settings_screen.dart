// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import '../services/settings_service.dart';
import '../widgets/settings_widgets/settings_card.dart';
import '../widgets/settings_widgets/settings_switch.dart';
import '../utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsService _settingsService = SettingsService();

  bool _backgroundMusic = true;
  bool _soundEffects = true;
  bool _vibration = true;
  bool _ttsEnabled = true;
  String _difficulty = 'easy';
  int _textSize = 1;
  String _language = 'ar';
  double _ttsRate = 0.5;
  double _ttsPitch = 1.0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final soundSettings = await _settingsService.getSoundSettings();
    final ttsSettings = await _settingsService.getTtsSettings();
    final difficulty = await _settingsService.getDifficulty();
    final textSize = await _settingsService.getTextSize();
    final language = await _settingsService.getLanguage();

    setState(() {
      _backgroundMusic = soundSettings['backgroundMusic']!;
      _soundEffects = soundSettings['soundEffects']!;
      _vibration = soundSettings['vibration']!;
      _ttsEnabled = ttsSettings['ttsEnabled'];
      _ttsRate = ttsSettings['ttsRate'];
      _ttsPitch = ttsSettings['ttsPitch'];
      _difficulty = difficulty;
      _textSize = textSize;
      _language = language;
    });
  }

  Future<void> _saveSoundSettings() async {
    await _settingsService.saveSoundSettings(
      backgroundMusic: _backgroundMusic,
      soundEffects: _soundEffects,
      vibration: _vibration,
    );
  }

  Future<void> _saveTtsSettings() async {
    await _settingsService.saveTtsSettings(
      ttsEnabled: _ttsEnabled,
      ttsRate: _ttsRate,
      ttsPitch: _ttsPitch,
    );
  }

  void _changeDifficulty(String newDifficulty) {
    setState(() {
      _difficulty = newDifficulty;
    });
    _settingsService.saveDifficulty(newDifficulty);
  }

  void _changeTextSize(int newSize) {
    setState(() {
      _textSize = newSize;
    });
    _settingsService.saveTextSize(newSize);
  }

  void _changeLanguage(String newLanguage) {
    setState(() {
      _language = newLanguage;
    });
    _settingsService.saveLanguage(newLanguage);
  }

  void _showDifficultyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('مستوى الصعوبة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('سهل'),
                leading: Radio<String>(
                  value: 'easy',
                  groupValue: _difficulty,
                  onChanged: (String? value) {
                    if (value != null) {
                      _changeDifficulty(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('متوسط'),
                leading: Radio<String>(
                  value: 'medium',
                  groupValue: _difficulty,
                  onChanged: (String? value) {
                    if (value != null) {
                      _changeDifficulty(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ListTile(
                title: const Text('صعب'),
                leading: Radio<String>(
                  value: 'hard',
                  groupValue: _difficulty,
                  onChanged: (String? value) {
                    if (value != null) {
                      _changeDifficulty(value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTtsSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('إعدادات النطق'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // سرعة النطق
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('سرعة النطق: ${(_ttsRate * 100).toInt()}%'),
                        Slider(
                          value: _ttsRate,
                          min: 0.3,
                          max: 0.8,
                          divisions: 5,
                          onChanged: (double value) {
                            setState(() {
                              _ttsRate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // درجة الصوت
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('درجة الصوت: ${(_ttsPitch * 100).toInt()}%'),
                        Slider(
                          value: _ttsPitch,
                          min: 0.5,
                          max: 1.5,
                          divisions: 5,
                          onChanged: (double value) {
                            setState(() {
                              _ttsPitch = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    _saveTtsSettings();
                    Navigator.pop(context);
                  },
                  child: const Text('حفظ'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text(
          'الإعدادات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // إعدادات الصوت
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'إعدادات الصوت',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SettingsCard(
            title: 'موسيقى الخلفية',
            subtitle: 'تشغيل أو إيقاف الموسيقى التصويرية',
            icon: Icons.music_note,
            iconColor: Colors.green,
            trailing: SettingsSwitch(
              value: _backgroundMusic,
              onChanged: (bool value) {
                setState(() {
                  _backgroundMusic = value;
                });
                _saveSoundSettings();
              },
              activeColor: Colors.green,
            ),
          ),

          SettingsCard(
            title: 'تأثيرات الصوت',
            subtitle: 'تشغيل أو إيقاف أصوات التفاعل',
            icon: Icons.volume_up,
            iconColor: Colors.blue,
            trailing: SettingsSwitch(
              value: _soundEffects,
              onChanged: (bool value) {
                setState(() {
                  _soundEffects = value;
                });
                _saveSoundSettings();
              },
              activeColor: Colors.blue,
            ),
          ),

          const SizedBox(height: 20),

          // إعدادات النطق
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'إعدادات النطق',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SettingsCard(
            title: 'تفعيل النطق',
            subtitle: 'سماع أسماء الألوان والأشكال',
            icon: Icons.record_voice_over,
            iconColor: Colors.purple,
            trailing: SettingsSwitch(
              value: _ttsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _ttsEnabled = value;
                });
                _saveTtsSettings();
              },
              activeColor: Colors.purple,
            ),
          ),

          SettingsCard(
            title: 'إعدادات النطق المتقدمة',
            subtitle: 'تعديل سرعة ودرجة الصوت',
            icon: Icons.settings_voice,
            iconColor: Colors.orange,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: _showTtsSettingsDialog,
          ),

          const SizedBox(height: 20),

          // إعدادات اللعبة
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'إعدادات اللعبة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SettingsCard(
            title: 'مستوى الصعوبة',
            subtitle: 'اختر مستوى التحدي المناسب',
            icon: Icons.auto_awesome,
            iconColor: Colors.red,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _difficulty == 'easy' ? 'سهل' :
                  _difficulty == 'medium' ? 'متوسط' : 'صعب',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: _showDifficultyDialog,
          ),

          SettingsCard(
            title: 'حجم النص',
            subtitle: 'اختر حجم النص المناسب',
            icon: Icons.text_fields,
            iconColor: Colors.teal,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _textSize == 0 ? 'صغير' :
                  _textSize == 1 ? 'متوسط' : 'كبير',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('حجم النص'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('صغير'),
                          leading: Radio<int>(
                            value: 0,
                            groupValue: _textSize,
                            onChanged: (int? value) {
                              if (value != null) {
                                _changeTextSize(value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('متوسط'),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: _textSize,
                            onChanged: (int? value) {
                              if (value != null) {
                                _changeTextSize(value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('كبير'),
                          leading: Radio<int>(
                            value: 2,
                            groupValue: _textSize,
                            onChanged: (int? value) {
                              if (value != null) {
                                _changeTextSize(value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          SettingsCard(
            title: 'اللغة',
            subtitle: 'اختر لغة التطبيق',
            icon: Icons.language,
            iconColor: Colors.blue,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _language == 'ar' ? 'العربية' : 'English',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('اللغة'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('العربية'),
                          leading: Radio<String>(
                            value: 'ar',
                            groupValue: _language,
                            onChanged: (String? value) {
                              if (value != null) {
                                _changeLanguage(value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('English'),
                          leading: Radio<String>(
                            value: 'en',
                            groupValue: _language,
                            onChanged: (String? value) {
                              if (value != null) {
                                _changeLanguage(value);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 30),

          // أزرار إضافية
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.blue),
                  title: const Text('عن التطبيق'),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'العالم الملون',
                      applicationVersion: '1.0.0',
                      children: const [
                        Text('تطبيق تعليمي تفاعلي للأطفال'),
                        Text('مصمم للأطفال من عمر 3-6 سنوات'),
                        Text('يتضمن تعلم الألوان والأشكال مع النطق'),
                      ],
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restart_alt, color: Colors.orange),
                  title: const Text('إعادة التعيين'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('إعادة التعيين'),
                          content: const Text('هل تريد مسح كل الإعدادات؟'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('إلغاء'),
                            ),
                            TextButton(
                              onPressed: () {
                                _settingsService.clearAllSettings();
                                _loadSettings();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('تم مسح كل الإعدادات'),
                                  ),
                                );
                              },
                              child: const Text('تأكيد'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}