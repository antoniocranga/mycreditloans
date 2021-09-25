import 'package:http/http.dart' as http;
import 'package:mycreditloans/models/exceptions.dart';

class APIManager {
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
