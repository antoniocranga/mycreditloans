import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';

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

class ModalScreen extends StatefulWidget {
  final ValueChanged<String> valueChanged;
  final String? selectedPeriod;
  const ModalScreen(
      {Key? key, required this.selectedPeriod, required this.valueChanged})
      : super(key: key);

  @override
  _ModalScreenState createState() => _ModalScreenState();
}

class _ModalScreenState extends State<ModalScreen> {
  String? auxiliary;
  @override
  void initState() {
    auxiliary = widget.selectedPeriod;
    super.initState();
  }
  final List<String> period = const ["1 lună", "3 luni", "6 luni", "1 an"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.grey),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(period[index]),
                trailing: auxiliary == period[index]
                    ? Icon(Icons.done_rounded, color: logoColor)
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                onTap: () {
                  setState(() {
                    auxiliary = period[index];
                  });
                  widget.valueChanged(period[index]);
                },
              ),
              itemCount: period.length,
            ),
          ),
        ],
      ),
    );
  }
}


