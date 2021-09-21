import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget cardChild;
  final Color color;
  final Function setGender;
  ContentCard(
      {@required this.color, this.cardChild, this.setGender, this.padding});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setGender,
      child: Container(
        padding: padding,
        child: Center(child: cardChild),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
