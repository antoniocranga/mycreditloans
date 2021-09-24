import 'package:flutter/material.dart';

import '../constants.dart';

class LargeButton extends StatelessWidget {
  final VoidCallback? callback;
  final String label;
  const LargeButton({Key? key, this.callback, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 50,
      width: size.width,
      child: Material(
        color: logoColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
              child: Text(label,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16))),
          onTap: () {
            this.callback?.call();
          },
        ),
      ),
    );
  }
}
