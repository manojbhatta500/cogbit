import 'dart:convert';
import 'dart:developer';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:http/http.dart' as http;

class GetModuleList {
  Future<bool> getModuleList() async {
    final url = Uri.parse(Apis.getModuleList);
    final response = await http.get(
      url,
      headers: {
        'Cookie': Cookie.cookie,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log('status code is 200 so i must be getting true');
      log(body.toString());
      return true;
    } else {
      log('this is else statement ');
      return false;
    }
  }
}
