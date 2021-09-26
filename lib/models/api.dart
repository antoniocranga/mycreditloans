import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mycreditloans/models/exceptions.dart';

class APIManager {

  static Future<bool?> checkEligibility() async {
    final Uri uri = Uri.parse(
        'http://www.randomnumberapi.com/api/v1.0/random?min=1&max=10&count=1');

    final response = await http.get(uri);
    try {
      final body = APIManager.handleResponse(response);
      final decoded = (jsonDecode(body) as List).cast<int>();
      final answer = decoded.first;
      print("Number : $answer");
      return answer > 5;
    } catch (e) {
      return Future.error(e);
    }
  }

  static handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            "An error occured with statusCode: ${response.statusCode}");
    }
  }
}
