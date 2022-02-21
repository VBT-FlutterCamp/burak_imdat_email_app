import 'package:burak_imdat_email_app/feature/mail/model/mail_model.dart';

abstract class HttpService {
  Future<List<MailModel>> getDatas();
}
