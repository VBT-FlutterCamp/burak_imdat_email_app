import 'package:burak_imdat_email_app/core/constants/color_constants.dart';
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
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue * 2),
        ),
        child: _listTilePadding(context, _listVerticalPadding, _colors));
  }

  Padding _listTilePadding(BuildContext context, double _listVerticalPadding, ColorConstants _colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue),
      child: ListTile(
        tileColor: context.colorScheme.onBackground,
        minVerticalPadding: _listVerticalPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowValue * 2),
        ),
        title: _titleTextPadding(context),
        subtitle: _subTitleText(context),
        trailing: _deleteIconContainer(context, _colors),
      ),
    );
  }

  Padding _titleTextPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue),
      child: Text(
        model.title,
        style: context.textTheme.headline6?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Text _subTitleText(BuildContext context) {
    return Text(
      model.subTitle,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      ),
    );
  }

  Container _deleteIconContainer(BuildContext context, ColorConstants _colors) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.lowValue),
        color: _colors.mailCleanedBg,
      ),
      child: _deleteIconPadding(context, _colors),
    );
  }

  Padding _deleteIconPadding(BuildContext context, ColorConstants _colors) {
    return Padding(
      padding: context.paddingLow,
      child: Icon(
        Icons.delete,
        color: _colors.mailCardRemoveFg,
      ),
    );
  }
}
