import 'package:flutter/material.dart';

import '../constants.dart';

class LargeButton extends StatelessWidget {
  final VoidCallback? callback;
  final String label;
  final bool? loading;
  const LargeButton(
      {Key? key, this.callback, required this.label, this.loading})
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
              child: loading == true
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ))
                  : Text(label,
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
