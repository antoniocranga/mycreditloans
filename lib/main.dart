import 'package:flutter/material.dart';
import 'package:mycreditloans/screens/root.dart';

import 'models/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCreditLoans',
      theme: customThemeData,
      themeMode: ThemeMode.light,
      home: Root(),
    );
  }
}
