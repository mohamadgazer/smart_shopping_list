import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  // ملاحظة: استعملت .w و .h مع الأبعاد العرضية والطولية
  // و .sp مع أحجام الخطوط

  static double padding = 16.w;
  static double smallPadding = 8.w;
  static double spacing = 12.w;
  static double radius = 12.r; // r لأنها للزوايا بتكون دائرية

  static double appBarHeight = 56.h;
  static double iconSize = 24.w;
  static double buttonHeight = 48.h;
}
