import 'package:bmi_calculator1/app/calculatorBrain.dart';
import 'package:bmi_calculator1/app/constants.dart';
import 'package:bmi_calculator1/app/screens/result.dart';
import 'package:bmi_calculator1/app/widgets/bottom_container.dart';
import 'package:bmi_calculator1/app/widgets/round_custom_button.dart';
import 'package:bmi_calculator1/app/widgets/content_card.dart';
import 'package:bmi_calculator1/app/widgets/gender_card_child.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double result;
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContentCard(
                      color: gender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: GenderCardChild(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                      setGender: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                      child: ContentCard(
                    setGender: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color: gender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: GenderCardChild(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ContentCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$height",
                          style: kLargeInputValueStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        )
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                      min: 120,
                      max: 220,
                      // activeColor: Colors.white,
                      // Color(0xFFEB1555),
                      inactiveColor: Color(0xFFBD8E98),
                    ),
                  ),
                ],
              ),
              color: kActiveCardColor,
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ContentCard(
                    padding: EdgeInsets.all(8),
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: kLargeInputValueStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundCustomButton(
                              icon: FontAwesomeIcons.minus,
                              adjustWeightcallback: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundCustomButton(
                              icon: FontAwesomeIcons.plus,
                              adjustWeightcallback: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ContentCard(
                    color: kActiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: kLabelTextStyle,
                          ),
                          Text("$age", style: kLargeInputValueStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundCustomButton(
                                  icon: FontAwesomeIcons.minus,
                                  adjustWeightcallback: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              RoundCustomButton(
                                  icon: FontAwesomeIcons.plus,
                                  adjustWeightcallback: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            BottomContaier(
              text: "CALCULATE",
              calFunction: () {
                CalculatorBrain calBrain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              resultVal: calBrain.bmi(),
                              resultInterPretation:
                                  calBrain.getInterpretation(),
                              resultText: calBrain.getResult(),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
