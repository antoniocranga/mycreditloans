import 'package:flutter/material.dart';
import 'package:mycreditloans/screens/root.dart';
import 'package:provider/provider.dart';

import 'models/themedata.dart';
import 'models/user.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => User(),
    child: MyApp(),
  ));
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
