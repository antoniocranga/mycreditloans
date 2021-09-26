import 'dart:io';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  double? _sum;
  int? _period;
  String? _lastName;
  String? _firstName;
  bool? _employed;
  String? _jobTitle;
  double? _paycheck;
  File? _photo;

  double? get sum => _sum;
  int? get period => _period;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get employed => _employed;
  String? get jobTitle => _jobTitle;
  double? get paycheck => _paycheck;
  File? get photo => _photo;

  void updateFields({
    double? sum,
    int? period,
    String? lastName,
    String? firstName,
    bool? employed,
    String? jobTitle,
    double? paycheck,
    File? photo,
  }) {
    _sum = sum ?? _sum;
    _period = period ?? _period;
    _lastName = lastName ?? _lastName;
    _firstName = firstName ?? _firstName;
    _employed = employed ?? _employed;
    _jobTitle = jobTitle ?? _jobTitle;
    _paycheck = paycheck ?? _paycheck;
    _photo = photo ?? _photo;
    notifyListeners();
  }
}
