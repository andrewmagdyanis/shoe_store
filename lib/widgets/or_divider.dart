import 'dart:ui';
import 'package:flutter/material.dart';
import '../colors_constants.dart';
import '../helpers/sizes_helpers.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color txtColor;
  final Widget? child;

  const OrDivider({
    Key? key,
    this.text = 'OR',
    this.txtColor = WHITE,
    this.child,
  }) : super(key: key);

  //final Size size = window.physicalSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: displayWidth(context) * 0.85,
      child: Row(
        children: <Widget>[
          buildDivider(txtColor),
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: displayWidth(context) / 20,
                  color: txtColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            child ?? Container(),
          ]),
          buildDivider(txtColor),
        ],
      ),
    );
  }

  Expanded buildDivider(color) {
    return Expanded(
      child: Divider(
        color: color,
        height: 4,
        thickness: 1,
      ),
    );
  }
}
