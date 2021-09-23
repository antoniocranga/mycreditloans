import 'package:flutter/material.dart';
import 'package:mycreditloans/screens/root.dart';

import 'managers/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCreditLoans',
      theme: customThemeData,
      home: Root(),
    );
  }
}
