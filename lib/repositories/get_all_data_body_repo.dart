

import 'dart:convert';
import 'dart:developer';

import 'package:cogbit/models/all_data_body_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class GetAllDataBodyRepository {

  Future<Either<bool, AllDataBodyModel>> fetchAllDataBody(int getterId) async{
    final alldatabodyApi = "${Apis.getAllDataHeading}${getterId}";
    log('the dynamic api of alldata body is ${alldatabodyApi}');
    final url = Uri.parse(alldatabodyApi);
    final response = await http.get(
      url,
      headers: {
                'Cookie': Cookie.cookie,
      },
    );

        if (response.statusCode == 200){
          final body = jsonDecode(response.body);
      log("all data body repository: statuscode 200");
      log("all data body repository data from server is :${body}");
      final realData = AllDataBodyModel.fromJson(body);


    log('converted json into data successfully ');
    return Right(realData);

        }else{
            log('this is else statement of get all data body repo ');
       return  const Left(false);
        }







  }

}