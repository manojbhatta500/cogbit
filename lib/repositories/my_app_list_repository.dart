
import 'dart:convert';
import 'dart:developer';

import 'package:cogbit/blocs/my_app/my_app_bloc.dart';
import 'package:cogbit/models/my_apps_list_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


class MyAppListRepository {
  Future<Either<bool,MyAppListModule>> getMyAppList() async {
    final url = Uri.parse(Apis.getMyAppList);
    final response = await http.get(
      url,
      headers: {
        'Cookie': Cookie.cookie,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log('MyApp list Module:   status code is 200 so i must be getting true');
      log(body.toString());
      final data = MyAppListModule.fromJson(body);
      return Right(data);
    } else {
      log('MyApp list Module:    this is else statement ');
      return const Left(false);
    }
  }
}
