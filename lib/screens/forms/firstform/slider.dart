import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';

class SliderWidget extends StatelessWidget {
  final Function(double) onChangedSlider;
  final double currentSliderValue;
  const SliderWidget({Key? key, required this.onChangedSlider , required this.currentSliderValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Suma împrumutată : $currentSliderValue RON"),
        ),
        Slider(
          activeColor: logoColor,
          
          value: currentSliderValue,
          onChanged: onChangedSlider,
          min: 100,
          max: 1000,
          divisions: 18,
        ),
      ],
    );
  }
}