import 'package:flutter/material.dart';
import '../constants.dart';

class CustomIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  CustomIcon({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: KLabelTextStyle,
        ),
      ],
    );
  }
}
