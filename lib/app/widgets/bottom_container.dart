import 'package:bmi_calculator1/app/constants.dart';
import 'package:bmi_calculator1/app/screens/result.dart';
import 'package:flutter/material.dart';

class BottomContaier extends StatelessWidget {
  final Function calFunction;
  final String text;
  BottomContaier({this.text, this.calFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: calFunction,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Center(
          child: Text(
            text,
            style: kBottomContainerTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
