import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';
import 'package:mycreditloans/models/user.dart';
import 'package:mycreditloans/screens/forms/firstform/slider.dart';
import 'package:mycreditloans/screens/forms/secondform/secondform.dart';
import 'package:mycreditloans/utils.dart';
import 'package:mycreditloans/widgets/largeButton.dart';
import 'package:provider/provider.dart';

import 'modalbottomsheet/modalbottomsheet.dart';

class FirstForm extends StatefulWidget {
  FirstForm({Key? key}) : super(key: key);

  @override
  _FirstFormState createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  double currentSliderValue = 100.0;
  int selectedItem = 0;
  String? selectedPeriod;
  @override
  Widget build(BuildContext context) {
    final myModel = context.watch<User>();
    return Scaffold(
      appBar: AppBar(leading: buildCloseButton()),
      body: SafeArea(
        bottom: true,
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text("Împrumutul dorit", style: titleTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(
                  "Completează un prim formular în care vei furniza datele referitoare la împrumut",
                  style: contentTextStyle),
            ),
            SizedBox(
              height: 30,
            ),
            SliderWidget(
                onChangedSlider: onChangedSlider,
                currentSliderValue: currentSliderValue),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text("Rata lunară de : ${rataLunara()}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            ),
            ModalBottomSheet(
              selectedPeriod: selectedPeriod,
              valueChanged: (p) {
                setState(() {
                  selectedPeriod = p;
                });
              },
            ),
            Text(myModel.sum.toString()),
            Spacer(),
            if (selectedPeriod != null &&
                selectedPeriod != "Selectează perioada")
              LargeButton(
                  label: "Continuă",
                  callback: () {
                    final sum = currentSliderValue;
                    final period = fromPeriodToInt();
                    Provider.of<User>(context, listen: false)
                        .updateFields(sum: sum, period: period);
                    platformPush(context, SecondForm());
                  }),
          ],
        ),
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

  void onChangedSlider(double value) {
    setState(() {
      currentSliderValue = value;
    });
  }
}
