import 'dart:convert';
import 'dart:developer';
import 'package:cogbit/models/all_module_list_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetModuleList {
  Future<Either<bool,AllModuleListModel>> getModuleList() async {
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
      final data = AllModuleListModel.fromJson(body);
      return Right(data);
    } else {
      log('this is else statement ');
      return const Left(false);
    }
  }
}
