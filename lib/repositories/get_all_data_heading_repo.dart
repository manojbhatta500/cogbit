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
    log('The dynamic API of all data heading is $allDataHeadingApi');
    final url = Uri.parse(allDataHeadingApi);
    final response = await http.get(
      url,
      headers: {
        'Cookie': Cookie.cookie,
      },
    );

    if (response.statusCode == 200) {
      // Decode the outer JSON layer
      final outerJson = jsonDecode(response.body);
      log("All data heading repository: status code 200");
      log("All data heading repository data from server is: $outerJson");

      // Assuming the inner JSON string is inside the 't' key of the outer JSON
      final innerJsonString = outerJson['t'];

      // Decode the inner JSON string
      final innerJson = jsonDecode(innerJsonString);

      

      // Parse the inner JSON into your model
      final realData = AllDataHeadingModel.fromJson(innerJson);

      log('Converted JSON into data successfully');
      return Right(realData);
    } else {
      log('This is the else statement of get all data heading repo');
      return Left(false);
    }
  }
}
