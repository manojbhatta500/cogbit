import 'dart:convert';
import 'dart:developer';
import 'package:cogbit/models/all_data_heading_model.dart';
import 'package:cogbit/utils/api.dart';
import 'package:cogbit/utils/cookie.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AllDataHeadingRepository {

  Future<Either<bool, AllDataHeadingModel>> fetchAllDataHeadings(int getterId) async {
  final allDataHeadingApi = "${Apis.getAllDataHeading}$getterId";
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

    // Check if outerJson is a Map
    if (outerJson is Map<String, dynamic>) {
      // Extract the 't' key
      final tJson = outerJson['t'];

      if (tJson == null) {
        log('The key "t" does not exist or is null in the outer JSON');
        return Left(false);
      }

      // Check if tJson is a String and decode it if needed
      Map<String, dynamic> innerJson;
      if (tJson is String) {
        try {
          innerJson = jsonDecode(tJson);
        } catch (e) {
          log('Failed to decode the string in the "t" key: $e');
          return Left(false);
        }
      } else if (tJson is Map<String, dynamic>) {
        innerJson = tJson;
      } else {
        log('The key "t" is neither a string nor a Map');
        return Left(false);
      }

      log('The inner JSON response is: $innerJson');

      // Parse the inner JSON into your model
      final realData = AllDataHeadingModel.fromJson(innerJson);

      log('Converted JSON into data successfully');
      return Right(realData);
    } else {
      log("Unexpected response format. Received: ${outerJson.runtimeType}");
      return Left(false);
    }
  } else {
    log('This is the else statement of get all data heading repo');
    return Left(false);
  }
}


 
}
