import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';

import 'modalscreen.dart';

double getChildHeight(BuildContext context) {
  return 320.0 / MediaQuery.of(context).size.height;
}

class ModalBottomSheet extends StatelessWidget {
  final ValueChanged<String> valueChanged;
  final String? selectedPeriod;
  const ModalBottomSheet(
      {Key? key, required this.valueChanged, this.selectedPeriod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      height: 58,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedPeriod ?? "Selectează perioada",
                    style: labelTextStyle),
                Icon(Icons.arrow_drop_down, color: Colors.grey)
              ],
            ),
          ),
          onTap: () {
            showBottomSheet(context, valueChanged, selectedPeriod);
          },
        ),
      ),
    );
  }
}

Future<void> showBottomSheet(BuildContext context,
    ValueChanged<String> valueChanged, String? selectedPeriod) {
  return showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    isScrollControlled: true,
    builder: (BuildContext context) {
      final double childSize = (getChildHeight(context)).clamp(0, 1);
      return DraggableScrollableSheet(
        maxChildSize: childSize,
        initialChildSize: childSize,
        expand: false,
        builder: (context, controller) {
          return ModalScreen(
            valueChanged: valueChanged,
            selectedPeriod: selectedPeriod,
          );
        },
      );
    },
  );
}
