import 'package:burak_imdat_email_app/core/constants/color_constants.dart';
import 'package:burak_imdat_email_app/core/constants/image_constants.dart';
import 'package:burak_imdat_email_app/core/constants/string_constants.dart';
import 'package:burak_imdat_email_app/feature/mail/mail_view/mail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final StringConstants _strings = StringConstants.instance;
  final ColorConstants _colors = ColorConstants.instance;
  final ImageConstants _images = ImageConstants.instance;
  @override
  Widget build(BuildContext context) {
    const int _flexTen = 10;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.lowValue, vertical: context.mediumValue * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _homeTitleText(context),
              context.emptySizedHeightBoxNormal,
              _homeSubTitleText(context),
              _homeSubTitleSecondText(context),
              const Spacer(),
              _svgImageExpanded(_flexTen),
              const Spacer(),
              _homeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _svgImageExpanded(int _flexTen) {
    return Expanded(
      flex: _flexTen,
      child: SvgPicture.asset(
        _images.backgroundSVG,
      ),
    );
  }

  Text _homeTitleText(BuildContext context) {
    return Text(
      _strings.homeTitle,
      textAlign: TextAlign.center,
      style: context.textTheme.headline3?.copyWith(
        color: _colors.homeTitleColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _homeSubTitleText(BuildContext context) {
    return Text(
      _strings.subTitle,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(
        color: _colors.homeTitleColor,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text _homeSubTitleSecondText(BuildContext context) {
    return Text(
      _strings.subTitleSecond,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(
        color: _colors.homeTitleColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  ElevatedButton _homeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MailView()),
          (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        primary: context.colorScheme.onBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue * 2),
        ),
      ),
      child: _homeButtonTextPadding(context),
    );
  }

  Padding _homeButtonTextPadding(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        _strings.homeButton,
        style: context.textTheme.headline5?.copyWith(
          color: _colors.homeTitleColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
