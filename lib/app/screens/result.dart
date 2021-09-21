import 'package:bmi_calculator1/app/constants.dart';
import 'package:bmi_calculator1/app/widgets/bottom_container.dart';
import 'package:bmi_calculator1/app/widgets/content_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resultText;
  final String resultVal;
  final String resultInterPretation;

  Result({this.resultText, this.resultInterPretation, this.resultVal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ContentCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$resultText",
                      style: TextStyle(
                          color: Color(0XFF24D876),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$resultVal",
                      style: kLargeInputValueStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$resultInterPretation",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                color: kActiveCardColor,
              )),
          Expanded(
            child: BottomContaier(
              calFunction: () {
                Navigator.pop(context);
              },
              text: "RE-CALCULATE",
            ),
          ),
        ],
      ),
    );
  }
}
