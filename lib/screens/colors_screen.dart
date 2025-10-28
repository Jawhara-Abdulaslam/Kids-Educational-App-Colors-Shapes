// lib/screens/colors_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/color_button.dart';
import '../services/text_to_speech_service.dart';
import '../services/settings_service.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  String currentColorName = 'انقر على أي لون';
  Color currentColor = Colors.transparent;
  final TextToSpeechService _ttsService = TextToSpeechService();
  final SettingsService _settingsService = SettingsService();
  bool _ttsEnabled = true;
  bool _isInitialized = false;
  int _currentPage = 0;
  final int _colorsPerPage = 12; // تقليل العدد لكل صفحة

  // تحميل الألوان للصفحة الحالية فقط
  List<MapEntry<Color, String>> get _currentPageColors {
    final startIndex = _currentPage * _colorsPerPage;
    final endIndex = startIndex + _colorsPerPage;
    final allEntries = AppConstants.allColors.entries.toList();

    return allEntries.sublist(
      startIndex,
      endIndex > allEntries.length ? allEntries.length : endIndex,
    );
  }

  int get _totalPages => (AppConstants.allColors.length / _colorsPerPage).ceil();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // تهيئة سريعة بدون تأخير
  Future<void> _initializeApp() async {
    // تحميل الإعدادات أولاً
    await _loadTtsSettings();

    // تهيئة النطق في الخلفية
    _ttsService.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    });

    setState(() {
      _isInitialized = true; // عرض الواجهة فوراً
    });
  }

  Future<void> _loadTtsSettings() async {
    final ttsSettings = await _settingsService.getTtsSettings();
    if (mounted) {
      setState(() {
        _ttsEnabled = ttsSettings['ttsEnabled'];
      });
    }
    _ttsService.setTtsEnabled(_ttsEnabled);
  }

  void _onColorTap(Color color, String colorName) async {
    setState(() {
      currentColor = color;
      currentColorName = colorName;
    });

    if (_ttsEnabled) {
      await _ttsService.speak('هذا اللون هو $colorName');
    }

    _showColorFeedback(colorName);
  }

  void _showColorFeedback(String colorName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: currentColor,
        content: Text(
          'هذا اللون هو: $colorName',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
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
          'تعلم الألوان',
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
      body: Column(
        children: [
          // عرض اللون المحدد (يظهر فوراً)
          _buildColorDisplay(),

          // عناصر التحكم في الصفحات
          _buildPageControls(),

          // شبكة الألوان (تظهر فوراً)
          Expanded(
            child: _buildColorsGrid(),
          ),
        ],
    ),
    )
    );
  }

  Widget _buildColorDisplay() {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: currentColor == Colors.transparent ? Colors.grey[200] : currentColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
      ),
      child: Center(
        child: Text(
          currentColorName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: currentColor == Colors.transparent ? Colors.grey :
            currentColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPageControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: _previousPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: _currentPage > 0 ? AppConstants.primaryColor : Colors.grey,
            ),
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 4),
                Text('السابق'),
              ],
            ),
          ),

          Text(
            '${_currentPage + 1} / $_totalPages',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: _currentPage < _totalPages - 1 ? AppConstants.primaryColor : Colors.grey,
            ),
            child: const Row(
              children: [
                Text('التالي'),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: _currentPageColors.length,
      itemBuilder: (context, index) {
        final colorEntry = _currentPageColors[index];
        return ColorButton(
          color: colorEntry.key,
          name: colorEntry.value,
          onTap: () => _onColorTap(colorEntry.key, colorEntry.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _ttsService.stop();
    super.dispose();
  }
}