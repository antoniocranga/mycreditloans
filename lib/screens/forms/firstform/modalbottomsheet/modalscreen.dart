import 'package:flutter/material.dart';

import '../../../../constants.dart';

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


