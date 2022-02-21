class MailModel {
  final String title;
  final String subTitle;
  MailModel({required this.title, required this.subTitle});

  static List<MailModel> dummyList = [
    MailModel(title: 'Coding Journey', subTitle: 'www.coding-journey.io'),
    MailModel(title: 'Smashing Magazine', subTitle: 'https://www.smashingmagazine'),
    MailModel(title: 'UX Labs', subTitle: 'https://uxlabs.co'),
    MailModel(title: 'The Netlify Blog', subTitle: 'https://www.netlify.com/tags/newsl'),
  ];

  factory MailModel.fromJson(Map<String, dynamic> map) {
    return MailModel(
      title: map['name'] ?? '',
      subTitle: map['email'] ?? '',
    );
  }
}
