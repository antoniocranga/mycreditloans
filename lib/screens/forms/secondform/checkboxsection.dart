import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';

class CheckBoxSection extends StatelessWidget {
  final Function(bool) callback;
  final bool? employed;
  final bool employedValidator;
  const CheckBoxSection(
      {Key? key,
      required this.callback,
      this.employed,
      required this.employedValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Angajat?", style: labelTextStyle),
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: employed == true,
                        onChanged: (value) {
                          callback(true);
                        }),
                    Text("Da")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: employed == false,
                        onChanged: (value) {
                          callback(false);
                        }),
                    Text("Nu")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                if (employedValidator == false)
                  Text("Completează câmpul",
                      style: TextStyle(fontSize: 12, color: redColor))
              ],
            ),
          ],
        ));
  }
}
