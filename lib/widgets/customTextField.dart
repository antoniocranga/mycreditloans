import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool? valid;
  final bool enabled;
  final TextInputType textInputType;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.label,
      this.valid,
      this.enabled = true,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: TextField(
        enabled: enabled,
        keyboardType: textInputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            errorText: valid == false ? "Completează câmpul" : null,
            labelText: this.label,
            labelStyle: labelTextStyle),
        controller: this.controller,
      ),
    );
  }
}
