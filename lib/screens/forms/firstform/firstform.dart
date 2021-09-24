import 'package:flutter/material.dart';
import 'package:mycreditloans/managers/user.dart';
import 'package:mycreditloans/screens/forms/firstform/dropdown.dart';
import 'package:mycreditloans/screens/forms/firstform/slider.dart';
import 'package:mycreditloans/screens/forms/secondform/secondform.dart';
import 'package:mycreditloans/utils.dart';
import 'package:mycreditloans/widgets/largeButton.dart';

import '../../root.dart';

class FirstForm extends StatefulWidget {
  FirstForm({Key? key}) : super(key: key);

  @override
  _FirstFormState createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  double currentSliderValue = 100.0;

  String? selectedPeriod;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(leading: buildCloseButton()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text("Împrumutul dorit",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
                "Completează un prim formular în care vei furniza datele referitoare la împrumut",
                style:
                    TextStyle(fontWeight: FontWeight.w400, color: Colors.grey)),
          ),
          SizedBox(
            height: 30,
          ),
          SliderWidget(
              onChangedSlider: onChangedSlider,
              currentSliderValue: currentSliderValue),
          DropDownWidget(
              onChangedDropdown: onChangedDropdown,
              selectedPeriod: selectedPeriod),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text("Rata lunară de : ${rataLunara()}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          ),
          Spacer(),
          if (selectedPeriod != null && selectedPeriod != "Selectează perioada")
            LargeButton(
                label: "Continuă",
                callback: () {
                  final sum = currentSliderValue;
                  final period = fromPeriodToInt();
                  localUser = localUser.copyWith(sum: sum, period: period);

                  platformPush(context, SecondForm());
                }),
        ],
      ),
    );
  }

  String rataLunara() {
    final totalSum = currentSliderValue;
    final nrofMonths = fromPeriodToInt();
    if (nrofMonths == 0)
      return "";
    else {
      final res = totalSum / nrofMonths + totalSum / 100;

      return "${res.toStringAsPrecision(4)} RON";
    }
  }

  int fromPeriodToInt() {
    switch (selectedPeriod) {
      case "1 lună":
        return 1;
      case "3 luni":
        return 3;
      case "6 luni":
        return 6;
      case "1 an":
        return 12;
      default:
        return 0;
    }
  }

  void onChangedDropdown(String? value) {
    setState(() {
      selectedPeriod = value;
    });
  }

  void onChangedSlider(double value) {
    setState(() {
      currentSliderValue = value;
    });
  }
}
