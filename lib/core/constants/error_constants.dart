class ErrorConstants {
  static ErrorConstants? _instance;
  static ErrorConstants get instance => _instance ??= ErrorConstants._init();
  ErrorConstants._init();

  String get httpGetError => 'Error while getting data by http';
}
