import 'package:burak_imdat_email_app/core/constants/color_constants.dart';
import 'package:burak_imdat_email_app/core/constants/string_constants.dart';
import 'package:burak_imdat_email_app/feature/mail/model/mail_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MailCard extends StatelessWidget {
  const MailCard({Key? key, required this.model}) : super(key: key);
  final MailModel model;
  @override
  Widget build(BuildContext context) {
    const double _listVerticalPadding = 16;
    final ColorConstants _colors = ColorConstants.instance;
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue),
      child: ListTile(
        tileColor: context.colorScheme.onBackground,
        minVerticalPadding: _listVerticalPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue * 2),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: context.lowValue),
          child: Text(
            model.title,
            style: context.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: Text(
          model.subTitle,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.lowValue),
            color: _colors.mailCleanedBg,
          ),
          child: Padding(
            padding: context.paddingLow,
            child: Icon(
              Icons.delete,
              color: _colors.mailCardRemoveFg,
            ),
          ),
        ),
      ),
    );
  }
}
