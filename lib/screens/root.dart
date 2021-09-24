import 'package:flutter/material.dart';
import 'package:mycreditloans/screens/forms/firstform/firstform.dart';
import 'package:mycreditloans/utils.dart';
import 'package:mycreditloans/widgets/largeButton.dart';

class Root extends StatefulWidget {
  Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      top: false,
      left: false,
      right: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/piggie.png'),
          Column(
            children: [
              Text("Investește în tine.",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Text("Ia-ți un împrumut de la MyCreditLoans!",
                  style: TextStyle(
                    fontSize: 16,
                  ))
            ],
          ),
          Column(
            children: [
              LargeButton(
                label: "Continuă",
                callback: () => platformPush(context, FirstForm()),
              ),
              Text("Dobândă lunară de la 1%"),
            ],
          ),
        ],
      ),
    ));
  }
}
