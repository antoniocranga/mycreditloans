import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';
import 'package:mycreditloans/screens/forms/firstform/firstform.dart';
import 'package:mycreditloans/utils.dart';

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
              Text("Ia-ți un împrumut de la Mycreditloans!",
                  style: TextStyle(
                    fontSize: 16,
                  ))
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 50,
                width: size.width,
                child: Material(
                  color: logoColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Center(
                        child: Text("Continua",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16))),
                    onTap: (){},
                  ),
                ),
              ),
              Text("Dobanda lunara de la 1%"),
            ],
          ),
        ],
      ),
    ));
  }
}
