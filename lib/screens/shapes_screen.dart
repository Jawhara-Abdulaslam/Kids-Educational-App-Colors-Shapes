// lib/screens/shapes_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../services/text_to_speech_service.dart';
import '../services/settings_service.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  final TextToSpeechService _ttsService = TextToSpeechService();
  final SettingsService _settingsService = SettingsService();
  bool _ttsEnabled = true;
  bool _ttsInitialized = false;
  String _selectedCategory = 'الكل';
  String _selectedShapeName = 'اختر شكلاً'; // اسم الشكل المختار

  List<Map<String, dynamic>> get _filteredShapes {
    if (_selectedCategory == 'الكل') {
      return AppConstants.allShapes;
    }
    return AppConstants.allShapes
        .where((shape) => shape['category'] == _selectedCategory)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // تهيئة التطبيق مع معالجة الأخطاء
  Future<void> _initializeApp() async {
    try {
      // تحميل الإعدادات أولاً
      final ttsSettings = await _settingsService.getTtsSettings();

      // تهيئة خدمة النطق مع الانتظار حتى تكتمل
      await _ttsService.initialize();

      setState(() {
        _ttsEnabled = ttsSettings['ttsEnabled'];
        _ttsInitialized = true;
      });

      _ttsService.setTtsEnabled(_ttsEnabled);

    } catch (e) {
      print('خطأ في التهيئة: $e');
      setState(() {
        _ttsInitialized = true; // نسمح للتطبيق بالعمل حتى مع فشل النطق
      });
    }
  }

  void _onShapeTap(String shapeName, String description) async {
    setState(() {
      _selectedShapeName = shapeName; // تحديث اسم الشكل المختار
    });

    if (!_ttsInitialized) {
      _showShapeFeedback('جاري التهيئة...');
      return;
    }

    if (_ttsEnabled) {
      try {
        await _ttsService.speak('هذا الشكل هو $shapeName');
      } catch (e) {
        print('خطأ في النطق: $e');
        _showShapeFeedback('خطأ في قراءة الصوت');
      }
    }
    _showShapeFeedback(shapeName);
  }

  void _showShapeFeedback(String shapeName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('هذا الشكل هو: $shapeName'),
        backgroundColor: AppConstants.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text(
          'تعلم الأشكال',
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
          // الخلية الثابتة لعرض اسم الشكل المختار
          _buildSelectedShapeHeader(),

          // فلاتر التصنيفات
          _buildCategoryFilters(),

          // شبكة البطاقات
          Expanded(
            child: _buildShapesGrid(),
          ),
        ],
      ),
    );
  }

  // الخلية الثابتة لعرض اسم الشكل المختار
  Widget _buildSelectedShapeHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.all(12),
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
        border: Border.all(
          color: AppConstants.primaryColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            'الشكل المختار',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedShapeName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // أيقونة مؤشر
          Icon(
            Icons.arrow_drop_down,
            color: AppConstants.primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppConstants.shapeCategories.map((category) {
          final isSelected = _selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: FilterChip(
              label: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category;
                  _selectedShapeName = 'اختر شكلاً'; // إعادة تعيين الشكل المختار
                });
              },
              backgroundColor: Colors.white,
              selectedColor: AppConstants.primaryColor,
              checkmarkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppConstants.primaryColor : Colors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildShapesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عمودين
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9, // نسبة الطول إلى العرض
      ),
      itemCount: _filteredShapes.length,
      itemBuilder: (context, index) {
        final shape = _filteredShapes[index];
        return _buildShapeCard(shape);
      },
    );
  }

  Widget _buildShapeCard(Map<String, dynamic> shape) {
    final isSelected = _selectedShapeName == shape['name'];

    return Card(
      elevation: isSelected ? 8 : 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected
            ? BorderSide(color: AppConstants.primaryColor, width: 3)
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _onShapeTap(shape['name'], shape['description']),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة الشكل
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: shape['color'].withOpacity(0.15),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: shape['color'],
                  width: 3,
                ),
              ),
              child: Icon(
                shape['icon'],
                color: shape['color'],
                size: 36,
              ),
            ),

            const SizedBox(height: 12),

            // اسم الشكل
            Text(
              shape['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? AppConstants.primaryColor : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 4),

            // وصف الشكل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                shape['description'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 8),

            // أيقونة الصوت
            Icon(
              Icons.volume_up,
              color: isSelected ? AppConstants.primaryColor : Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ttsService.stop(); // إيقاف النطق فقط
    super.dispose();
  }
}