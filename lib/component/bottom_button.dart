import 'package:flutter/material.dart';
import 'package:mehalybmi/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTab;
  BottomButton({@required this.onTab, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ),
        ),
        color: KBottomColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        width: double.infinity,
        height: KButtomContainerHeight,
      ),
    );
  }
}
