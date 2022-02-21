import '../extension/string_extension.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  static const String basePath = 'assets/';
  static const String svgPath = 'svg/';

  String get backgroundSVG => basePath + svgPath + 'background'.toSvg;
}
