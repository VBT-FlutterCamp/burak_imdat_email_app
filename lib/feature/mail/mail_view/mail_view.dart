import 'package:burak_imdat_email_app/core/constants/color_constants.dart';
import 'package:burak_imdat_email_app/core/constants/string_constants.dart';
import 'package:burak_imdat_email_app/feature/mail/model/mail_model.dart';
import 'package:burak_imdat_email_app/feature/mail/service/concrete/http_manager.dart';
import 'package:burak_imdat_email_app/product/cards/mail_card.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MailView extends StatefulWidget {
  const MailView({Key? key}) : super(key: key);

  @override
  _MailViewState createState() => _MailViewState();
}

class _MailViewState extends State<MailView> {
  final ColorConstants _colors = ColorConstants.instance;
  final StringConstants _strings = StringConstants.instance;
  int _selectedItem = 0;
  final HttpManager _manager = HttpManager();
  bool _isLoading = false;

  /// Boş olmasın diye başta dummy ile doldurdum
  List<MailModel> mailModels = [];

  void setSelectedItem(int val) {
    _selectedItem = val;
    setState(() {});
  }

  void changeLoading() {
    _isLoading = !_isLoading;
    setState(() {});
  }

  Future<void> getDatas() async {
    changeLoading();
    mailModels = await _manager.getDatas();
    changeLoading();
  }

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors.homeTitleColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.normalValue, vertical: context.mediumValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.dynamicWidth(0.6),
                child: _mailTitleText(context),
              ),
              context.emptySizedHeightBoxLow,
              Row(
                children: [
                  _mailSubsText(context),
                  const Spacer(),
                  _mailCleanedContainer(context),
                ],
              ),
              context.emptySizedHeightBoxLow,
              Expanded(
                child: _malCardListView(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: _colors.mailCardRemoveFg,
        unselectedItemColor: Colors.grey,
        onTap: (val) {
          setSelectedItem(val);
        },
        items: [
          _bottomNavBarItem(Icons.folder),
          _bottomNavBarItem(Icons.settings),
          _bottomNavBarItem(Icons.show_chart_rounded),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(IconData icon) => BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: 32,
        ),
        label: '',
      );

  Text _mailTitleText(BuildContext context) {
    return Text(
      _strings.mailTitle,
      style: context.textTheme.headline4?.copyWith(
        color: context.colorScheme.onBackground,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _mailSubsText(BuildContext context) {
    return Text(
      _strings.mailSubs,
      style: context.textTheme.headline6?.copyWith(
        color: context.colorScheme.onPrimary,
      ),
    );
  }

  Container _mailCleanedContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _colors.mailCleanedBg,
        borderRadius: BorderRadius.circular(context.lowValue),
      ),
      child: _mailCleanedTextPadding(context),
    );
  }

  Padding _mailCleanedTextPadding(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        _strings.mailCleaned,
        style: context.textTheme.headline6?.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget _malCardListView() {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: mailModels.length,
            itemBuilder: (context, index) {
              return MailCard(model: mailModels[index]);
            },
          );
  }
}
