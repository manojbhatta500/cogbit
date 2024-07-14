import 'dart:convert';
import 'dart:developer';
import 'package:cogbit/models/email_login_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class EmailLoginRepository {
  Future<Either<bool, EmailLoginModel>> EmailLogin(loginId, password) async {
    final url = Uri.parse(Apis.emailLogin);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          {"loginId": loginId, "password": password, "rememberMe": true}),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      log('status code is 200 so i must be getting true');
      final realData = EmailLoginModel.fromJson(body);
      log(body.toString());
      return Right(realData);
    } else {
      log('this is else statement ');
      return Left(false);
    }
  }
}
