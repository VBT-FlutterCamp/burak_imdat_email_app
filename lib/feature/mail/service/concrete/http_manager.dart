import 'dart:convert';

import 'package:burak_imdat_email_app/core/constants/error_constants.dart';
import 'package:burak_imdat_email_app/feature/mail/model/mail_model.dart';
import 'package:burak_imdat_email_app/feature/mail/service/abstract/http_service.dart';
import 'package:http/http.dart' as http;

class HttpManager extends HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String comments = '/comments';
  final ErrorConstants _errors = ErrorConstants.instance;
  @override
  Future<List<MailModel>> getDatas() async {
    final response = await http.get(Uri.parse(baseUrl + comments));

    switch (response.statusCode) {
      case 200:
        return List<MailModel>.from(jsonDecode(response.body).map((obj) => MailModel.fromJson(obj)));

      default:
        throw Exception(_errors.httpGetError);
    }
  }
}
