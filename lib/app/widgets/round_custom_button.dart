import 'package:flutter/material.dart';

class RoundCustomButton extends StatelessWidget {
  final IconData icon;
  final Function adjustWeightcallback;
  RoundCustomButton({@required this.icon, @required this.adjustWeightcallback});
  @override
  Widget build(BuildContext context) {
    return Material(
        shape: CircleBorder(),
        elevation: 0,
        child: InkWell(
          onTap: adjustWeightcallback,
          child: Container(
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF4C4F5E),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ));
  }
}
