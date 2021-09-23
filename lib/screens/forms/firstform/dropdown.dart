import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final Function(String?) onChangedDropdown;
  final String? selectedPeriod;
  const DropDownWidget(
      {Key? key, required this.onChangedDropdown, this.selectedPeriod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            onChanged: onChangedDropdown,
            value: selectedPeriod,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            hint: Text("Selectează perioada",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
            items: const [
              "Selectează perioada",
              "1 luna",
              "3 luni",
              "6 luni",
              "1 an"
            ].map((pp) {
              return DropdownMenuItem(
                child: new Text(pp),
                value: pp,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
