import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class User {
  final double? sum;
  final int? period;
  final String? firstName;
  final String? lastName;
  final bool? employed;
  final String? jobTitle;
  final double? paycheck;
  final File? photo;
  User(
      {this.sum,
      this.period,
      this.firstName,
      this.lastName,
      this.employed,
      this.jobTitle,
      this.photo,
      this.paycheck});

  User copyWith(
      {double? sum,
      int? period,
      String? firstName,
      String? lastName,
      bool? employed,
      String? jobTitle,
      double? paycheck,
      File? photo}) {
    return User(
      sum: sum ?? this.sum,
      period: period ?? this.period,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      employed: employed ?? this.employed,
      jobTitle: jobTitle ?? this.jobTitle,
      paycheck: paycheck ?? this.paycheck,
      photo: photo ?? this.photo,
    );
  }

  Future<bool?> checkEligibility() async {
    final Uri uri = Uri.parse(
        'http://www.randomnumberapi.com/api/v1.0/random?min=1&max=10&count=1');

    final result = await http.get(uri);
    if (result.statusCode == 200) {
      try {
        final body = (jsonDecode(result.body) as List).cast<int>();
        final answer = body.first;
        print("Number : $answer");
        return answer > 5;
      } catch (e) {
        return Future.error(e);
      }
    } else {
      print(result.body);
      return Future.error(result.body);
    }
  }
}

User localUser = User();
