// lib/utils/constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // الألوان الأساسية للتطبيق
  static const Color primaryColor = Color(0xFF810410);
  static const Color secondaryColor = Color(0xFFAAE05A);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF333333);

  // جميع الألوان الأساسية والمشتقة (أكثر من 50 لون)
  static final Map<Color, String> allColors = {
    // الأحمر ومشتقاته
    Colors.red: 'أحمر',
    Colors.red[50]!: 'أحمر فاتح جداً',
    Colors.red[100]!: 'أحمر فاتح',
    Colors.red[200]!: 'أحمر ناعم',
    Colors.red[300]!: 'أحمر وردي',
    Colors.red[400]!: 'أحمر زهري',
    Colors.red[500]!: 'أحمر',
    Colors.red[600]!: 'أحمر غامق',
    Colors.red[700]!: 'أحمر قاني',
    Colors.red[800]!: 'أحمر داكن',
    Colors.red[900]!: 'أحمر عميق',

    // الوردي ومشتقاته
    Colors.pink: 'وردي',
    Colors.pink[50]!: 'وردي فاتح جداً',
    Colors.pink[100]!: 'وردي فاتح',
    Colors.pink[200]!: 'وردي ناعم',
    Colors.pink[300]!: 'وردي',
    Colors.pink[400]!: 'وردي زاهي',
    Colors.pink[500]!: 'وردي',
    Colors.pink[600]!: 'وردي غامق',
    Colors.pink[700]!: 'وردي فوشيا',
    Colors.pink[800]!: 'وردي داكن',
    Colors.pink[900]!: 'وردي عميق',

    // البنفسجي ومشتقاته
    Colors.purple: 'بنفسجي',
    Colors.purple[50]!: 'بنفسجي فاتح جداً',
    Colors.purple[100]!: 'بنفسجي فاتح',
    Colors.purple[200]!: 'بنفسجي ناعم',
    Colors.purple[300]!: 'بنفسجي',
    Colors.purple[400]!: 'بنفسجي زاهي',
    Colors.purple[500]!: 'بنفسجي',
    Colors.purple[600]!: 'بنفسجي غامق',
    Colors.purple[700]!: 'بنفسجي داكن',
    Colors.purple[800]!: 'بنفسجي عميق',
    Colors.purple[900]!: 'بنفسجي ملكي',

    // الأزرق العميق ومشتقاته
    Colors.deepPurple: 'بنفسجي غامق',
    Colors.deepPurple[50]!: 'بنفسجي فاتح',
    Colors.deepPurple[100]!: 'بنفسجي ناعم',
    Colors.deepPurple[200]!: 'بنفسجي',
    Colors.deepPurple[300]!: 'بنفسجي متوسط',
    Colors.deepPurple[400]!: 'بنفسجي زاهي',
    Colors.deepPurple[500]!: 'بنفسجي غامق',
    Colors.deepPurple[600]!: 'بنفسجي داكن',
    Colors.deepPurple[700]!: 'بنفسجي عميق',
    Colors.deepPurple[800]!: 'بنفسجي ملكي',
    Colors.deepPurple[900]!: 'بنفسجي نهاري',

    // الأزرق ومشتقاته
    Colors.blue: 'أزرق',
    Colors.blue[50]!: 'أزرق فاتح جداً',
    Colors.blue[100]!: 'أزرق فاتح',
    Colors.blue[200]!: 'أزرق سماوي',
    Colors.blue[300]!: 'أزرق ناعم',
    Colors.blue[400]!: 'أزرق',
    Colors.blue[500]!: 'أزرق',
    Colors.blue[600]!: 'أزرق غامق',
    Colors.blue[700]!: 'أزرق داكن',
    Colors.blue[800]!: 'أزرق بحري',
    Colors.blue[900]!: 'أزرق نهاري',

    // الأزرق الفاتح ومشتقاته
    Colors.lightBlue: 'أزرق فاتح',
    Colors.lightBlue[50]!: 'أزرق فاتح جداً',
    Colors.lightBlue[100]!: 'أزرق سماوي فاتح',
    Colors.lightBlue[200]!: 'أزرق سماوي',
    Colors.lightBlue[300]!: 'أزرق فاتح',
    Colors.lightBlue[400]!: 'أزرق سماوي زاهي',
    Colors.lightBlue[500]!: 'أزرق فاتح',
    Colors.lightBlue[600]!: 'أزرق متوسط',
    Colors.lightBlue[700]!: 'أزرق',
    Colors.lightBlue[800]!: 'أزرق غامق',
    Colors.lightBlue[900]!: 'أزرق داكن',

    // السماوي ومشتقاته
    Colors.cyan: 'سماوي',
    Colors.cyan[50]!: 'سماوي فاتح جداً',
    Colors.cyan[100]!: 'سماوي فاتح',
    Colors.cyan[200]!: 'سماوي ناعم',
    Colors.cyan[300]!: 'سماوي',
    Colors.cyan[400]!: 'سماوي زاهي',
    Colors.cyan[500]!: 'سماوي',
    Colors.cyan[600]!: 'سماوي غامق',
    Colors.cyan[700]!: 'سماوي داكن',
    Colors.cyan[800]!: 'سماوي عميق',
    Colors.cyan[900]!: 'سماوي نهاري',

    // الأخضر ومشتقاته
    Colors.green: 'أخضر',
    Colors.green[50]!: 'أخضر فاتح جداً',
    Colors.green[100]!: 'أخضر فاتح',
    Colors.green[200]!: 'أخضر ناعم',
    Colors.green[300]!: 'أخضر',
    Colors.green[400]!: 'أخضر زاهي',
    Colors.green[500]!: 'أخضر',
    Colors.green[600]!: 'أخضر غامق',
    Colors.green[700]!: 'أخضر داكن',
    Colors.green[800]!: 'أخضر عميق',
    Colors.green[900]!: 'أخضر نهاري',

    // الأخضر الفاتح ومشتقاته
    Colors.lightGreen: 'أخضر فاتح',
    Colors.lightGreen[50]!: 'أخضر فاتح جداً',
    Colors.lightGreen[100]!: 'أخضر فاتح',
    Colors.lightGreen[200]!: 'أخضر ناعم',
    Colors.lightGreen[300]!: 'أخضر فاتح',
    Colors.lightGreen[400]!: 'أخضر زاهي',
    Colors.lightGreen[500]!: 'أخضر فاتح',
    Colors.lightGreen[600]!: 'أخضر متوسط',
    Colors.lightGreen[700]!: 'أخضر',
    Colors.lightGreen[800]!: 'أخضر غامق',
    Colors.lightGreen[900]!: 'أخضر داكن',

    // الأخضر المصفر ومشتقاته
    Colors.lime: 'أخضر مصفر',
    Colors.lime[50]!: 'أخضر مصفر فاتح',
    Colors.lime[100]!: 'أخضر مصفر ناعم',
    Colors.lime[200]!: 'أخضر مصفر',
    Colors.lime[300]!: 'أخضر مصفر زاهي',
    Colors.lime[400]!: 'أخضر مصفر',
    Colors.lime[500]!: 'أخضر مصفر',
    Colors.lime[600]!: 'أخضر مصفر غامق',
    Colors.lime[700]!: 'أخضر مصفر داكن',
    Colors.lime[800]!: 'أخضر مصفر عميق',
    Colors.lime[900]!: 'أخضر مصفر نهاري',

    // الأصفر ومشتقاته
    Colors.yellow: 'أصفر',
    Colors.yellow[50]!: 'أصفر فاتح جداً',
    Colors.yellow[100]!: 'أصفر فاتح',
    Colors.yellow[200]!: 'أصفر ناعم',
    Colors.yellow[300]!: 'أصفر',
    Colors.yellow[400]!: 'أصفر زاهي',
    Colors.yellow[500]!: 'أصفر',
    Colors.yellow[600]!: 'أصفر غامق',
    Colors.yellow[700]!: 'أصفر داكن',
    Colors.yellow[800]!: 'أصفر عميق',
    Colors.yellow[900]!: 'أصفر نهاري',

    // البرتقالي ومشتقاته
    Colors.orange: 'برتقالي',
    Colors.orange[50]!: 'برتقالي فاتح جداً',
    Colors.orange[100]!: 'برتقالي فاتح',
    Colors.orange[200]!: 'برتقالي ناعم',
    Colors.orange[300]!: 'برتقالي',
    Colors.orange[400]!: 'برتقالي زاهي',
    Colors.orange[500]!: 'برتقالي',
    Colors.orange[600]!: 'برتقالي غامق',
    Colors.orange[700]!: 'برتقالي داكن',
    Colors.orange[800]!: 'برتقالي عميق',
    Colors.orange[900]!: 'برتقالي نهاري',

    // البرتقالي العميق ومشتقاته
    Colors.deepOrange: 'برتقالي غامق',
    Colors.deepOrange[50]!: 'برتقالي فاتح',
    Colors.deepOrange[100]!: 'برتقالي ناعم',
    Colors.deepOrange[200]!: 'برتقالي',
    Colors.deepOrange[300]!: 'برتقالي زاهي',
    Colors.deepOrange[400]!: 'برتقالي غامق',
    Colors.deepOrange[500]!: 'برتقالي غامق',
    Colors.deepOrange[600]!: 'برتقالي داكن',
    Colors.deepOrange[700]!: 'برتقالي عميق',
    Colors.deepOrange[800]!: 'برتقالي ناري',
    Colors.deepOrange[900]!: 'برتقالي نهاري',

    // البني ومشتقاته
    Colors.brown: 'بني',
    Colors.brown[50]!: 'بني فاتح جداً',
    Colors.brown[100]!: 'بني فاتح',
    Colors.brown[200]!: 'بني ناعم',
    Colors.brown[300]!: 'بني',
    Colors.brown[400]!: 'بني متوسط',
    Colors.brown[500]!: 'بني',
    Colors.brown[600]!: 'بني غامق',
    Colors.brown[700]!: 'بني داكن',
    Colors.brown[800]!: 'بني عميق',
    Colors.brown[900]!: 'بني شوكولاتة',

    // الرمادي ومشتقاته
    Colors.grey: 'رمادي',
    Colors.grey[50]!: 'رمادي فاتح جداً',
    Colors.grey[100]!: 'رمادي فاتح',
    Colors.grey[200]!: 'رمادي ناعم',
    Colors.grey[300]!: 'رمادي',
    Colors.grey[400]!: 'رمادي متوسط',
    Colors.grey[500]!: 'رمادي',
    Colors.grey[600]!: 'رمادي غامق',
    Colors.grey[700]!: 'رمادي داكن',
    Colors.grey[800]!: 'رمادي عميق',
    Colors.grey[900]!: 'رمادي فحمي',

    // الأزرق الرمادي ومشتقاته
    Colors.blueGrey: 'أزرق رمادي',
    Colors.blueGrey[50]!: 'أزرق رمادي فاتح',
    Colors.blueGrey[100]!: 'أزرق رمادي ناعم',
    Colors.blueGrey[200]!: 'أزرق رمادي',
    Colors.blueGrey[300]!: 'أزرق رمادي متوسط',
    Colors.blueGrey[400]!: 'أزرق رمادي',
    Colors.blueGrey[500]!: 'أزرق رمادي',
    Colors.blueGrey[600]!: 'أزرق رمادي غامق',
    Colors.blueGrey[700]!: 'أزرق رمادي داكن',
    Colors.blueGrey[800]!: 'أزرق رمادي عميق',
    Colors.blueGrey[900]!: 'أزرق رمادي نهاري',

    // ألوان إضافية
    Colors.black: 'أسود',
    Colors.white: 'أبيض',
    Colors.teal: 'أخضر مزرق',
    Colors.indigo: 'نيلي',
    Colors.amber: 'كهرماني',
  };

  // جميع الأشكال (أكثر من 30 شكل)
  static final List<Map<String, dynamic>> allShapes = [
    // الأشكال الهندسية الأساسية
    {
      'name': 'دائرة',
      'icon': Icons.circle,
      'color': Colors.red,
      'description': 'شكل مستدير بدون زوايا',
      'category': 'أساسي',
    },
    {
      'name': 'مربع',
      'icon': Icons.square,
      'color': Colors.blue,
      'description': 'له أربعة أضلاع متساوية',
      'category': 'أساسي',
    },
    {
      'name': 'مثلث',
      'icon': Icons.change_history,
      'color': Colors.green,
      'description': 'له ثلاثة أضلاع وثلاث زوايا',
      'category': 'أساسي',
    },
    {
      'name': 'مستطيل',
      'icon': Icons.crop_landscape,
      'color': Colors.orange,
      'description': 'شكل له طول وعرض مختلفان',
      'category': 'أساسي',
    },
    {
      'name': 'معين',
      'icon': Icons.diamond,
      'color': Colors.purple,
      'description': 'شكل متساوي الأضلاع',
      'category': 'أساسي',
    },
    {
      'name': 'شكل سداسي',
      'icon': Icons.hexagon,
      'color': Colors.teal,
      'description': 'له ستة أضلاع متساوية',
      'category': 'أساسي',
    },
    {
      'name': 'شكل ثماني',
      'icon': Icons.add,
      'color': Colors.pink,
      'description': 'شكل زائد',
      'category': 'أساسي',
    },

    // الأشكال النجمية
    {
      'name': 'نجمة',
      'icon': Icons.star,
      'color': Colors.yellow,
      'description': 'شكل جميل له رؤوس متعددة',
      'category': 'نجمي',
    },
    {
      'name': 'نجمة ثلاثية',
      'icon': Icons.star_border,
      'color': Colors.amber,
      'description': 'نجمة بثلاثة رؤوس',
      'category': 'نجمي',
    },
    {
      'name': 'نجمة سداسية',
      'icon': Icons.star_half,
      'color': Colors.deepOrange,
      'description': 'نجمة بستة رؤوس',
      'category': 'نجمي',
    },

    // الأشكال الطبيعية
    {
      'name': 'قلب',
      'icon': Icons.favorite,
      'color': Colors.pink,
      'description': 'شكل الحب والصداقة',
      'category': 'طبيعي',
    },
    {
      'name': 'هلال',
      'icon': Icons.nights_stay,
      'color': Colors.purple,
      'description': 'شكل القمر في الليل',
      'category': 'طبيعي',
    },
    {
      'name': 'سحابة',
      'icon': Icons.cloud,
      'color': Colors.blue,
      'description': 'شكل السحاب في السماء',
      'category': 'طبيعي',
    },
    {
      'name': 'شمس',
      'icon': Icons.wb_sunny,
      'color': Colors.orange,
      'description': 'شكل الشمس المشرقة',
      'category': 'طبيعي',
    },
    {
      'name': 'قمر',
      'icon': Icons.nightlight_round,
      'color': Colors.indigo,
      'description': 'شكل القمر الكامل',
      'category': 'طبيعي',
    },
    {
      'name': 'زهرة',
      'icon': Icons.local_florist,
      'color': Colors.pink,
      'description': 'شكل الزهرة الجميلة',
      'category': 'طبيعي',
    },
    {
      'name': 'شجرة',
      'icon': Icons.park,
      'color': Colors.green,
      'description': 'شكل الشجرة الخضراء',
      'category': 'طبيعي',
    },

    // الأشكال الرياضية
    {
      'name': 'شكل بيضاوي',
      'icon': Icons.egg,
      'color': Colors.brown,
      'description': 'شكل بيضاوي مستطيل',
      'category': 'رياضي',
    },
    {
      'name': 'شكل قطع ناقص',
      'icon': Icons.add_a_photo_outlined,
      'color': Colors.teal,
      'description': 'شكل كمرة',
      'category': 'رياضي',
    },
    {
      'name': 'شكل متوازي أضلاع',
      'icon': Icons.rectangle,
      'color': Colors.blue,
      'description': 'شكل بأضلاع متوازية',
      'category': 'رياضي',
    },
    {
      'name': 'شكل شبه منحرف',
      'icon': Icons.trip_origin,
      'color': Colors.green,
      'description': 'شكل بقاعدتين متوازيتين',
      'category': 'رياضي',
    },

    // الأشكال الهندسية المعقدة
    {
      'name': 'شكل خماسي',
      'icon': Icons.pentagon,
      'color': Colors.purple,
      'description': 'شكل بخمسة أضلاع',
      'category': 'معقد',
    },
    {
      'name': 'شكل سباعي',
      'icon': Icons.hexagon,
      'color': Colors.indigo,
      'description': 'شكل بسبعة أضلاع',
      'category': 'معقد',
    },
    {
      'name': 'شكل حلقة',
      'icon': Icons.donut_large,
      'color': Colors.orange,
      'description': 'شكل دائري مجوف',
      'category': 'معقد',
    },
    {
      'name': 'شكل لولبي',
      'icon': Icons.waves,
      'color': Colors.blue,
      'description': 'شكل لولبي متداخل',
      'category': 'معقد',
    },

    // أشكال الحيوانات
    {
      'name': 'فراشة',
      'icon': Icons.access_alarms_outlined,
      'color': Colors.pink,
      'description': 'شكل منبة',
      'category': 'حيوان',
    },
    {
      'name': 'سمكة',
      'icon': Icons.sailing,
      'color': Colors.blue,
      'description': 'شكل السمكة في الماء',
      'category': 'حيوان',
    },
    {
      'name': 'طائر',
      'icon': Icons.paragliding,
      'color': Colors.red,
      'description': 'شكل الطائر الطائر',
      'category': 'حيوان',
    },

    // أشكال أخرى
    {
      'name': 'قوس قزح',
      'icon': Icons.grain,
      'color': Colors.deepPurple,
      'description': 'شكل شبك',
      'category': 'أخرى',
    },
    {
      'name': 'كرة',
      'icon': Icons.sports_baseball,
      'color': Colors.orange,
      'description': 'شكل الكرة المستديرة',
      'category': 'أخرى',
    },
    {
      'name': 'مكعب',
      'icon': Icons.cable,
      'color': Colors.grey,
      'description': ' شكل صاروخ',
      'category': 'أخرى',
    },
    {
      'name': 'هرم',
      'icon': Icons.temple_buddhist,
      'color': Colors.amber,
      'description': 'شكل الهرم الثلاثي',
      'category': 'أخرى',
    },
    {
      'name': 'كرة أرضية',
      'icon': Icons.public,
      'color': Colors.blue,
      'description': 'شكل الكرة الأرضية',
      'category': 'أخرى',
    },
    {
      'name': 'صاروخ',
      'icon': Icons.rocket_launch,
      'color': Colors.red,
      'description': 'شكل الصاروخ الطائر',
      'category': 'أخرى',
    },
    {
      'name': 'طائرة',
      'icon': Icons.airplanemode_active,
      'color': Colors.blue,
      'description': 'شكل الطائرة',
      'category': 'أخرى',
    },
    {
      'name': 'سيارة',
      'icon': Icons.directions_car,
      'color': Colors.red,
      'description': 'شكل السيارة',
      'category': 'أخرى',
    },
    {
      'name': 'منزل',
      'icon': Icons.house,
      'color': Colors.brown,
      'description': 'شكل المنزل',
      'category': 'أخرى',
    },
    {
      'name': 'قلعة',
      'icon': Icons.castle,
      'color': Colors.grey,
      'description': 'شكل القلعة',
      'category': 'أخرى',
    },
  ];

  // فئات الأشكال
  static final List<String> shapeCategories = [
    'الكل',
    'أساسي',
    'نجمي',
    'طبيعي',
    'رياضي',
    'معقد',
    'حيوان',
    'أخرى',
  ];

  // الألوان التعليمية الأساسية (للشاشة الرئيسية)
  static const List<Color> learningColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
  ];
}