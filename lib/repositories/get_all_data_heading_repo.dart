import 'dart:convert';
import 'dart:developer';

import 'package:cogbit/models/all_data_heading_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;


class AllDataHeadingRepository {

    Future<Either<bool, AllDataHeadingModel>> fetchAllDataHeadings(int getterId) async {
      final allDataHeadingApi = "${Apis.getAllDataHeading}${getterId}";
      log('the dynamic api of alldata Heading is ${allDataHeadingApi}');
    final url = Uri.parse(allDataHeadingApi);
    final response = await http.get(
      url,
      headers: {
                'Cookie': Cookie.cookie,

      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      log("all data heading repository: statuscode 200");
      log("all data heading repository data from server is :${body}");
      final realData = AllDataHeadingModel.fromJson(body);


    log('converted json into data successfully ');
    return Right(realData);

      

      // log('status code is 200 so i must be getting true');
      // final realData = EmailLoginModel.fromJson(body);
      // log(body.toString());
      // return Right(realData);
    } else {
       log('this is else statement of get all data heading repo ');
       return Left(false);
    }
  }

}