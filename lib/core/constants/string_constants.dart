class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();

  String get homeTitle => 'Cleaning your inbox has never been easier.';
  String get subTitle => 'Clean up old subscriptions and';
  String get subTitleSecond => 'say no to email carbon!';
  String get homeButton => 'Get Started';
  String get mailTitle => 'Keep up the carbon-free work! 🎉';
  String get mailSubs => 'Subscriptions (18)';
  String get mailCleaned => '25% Cleaned';
}
