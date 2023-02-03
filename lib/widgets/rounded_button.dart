import 'package:flutter/material.dart';

import 'package:shoe_store/colors_constants.dart';
import '../helpers/sizes_helpers.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color? color, textColor;
  final double widthRatio;
  final double heightRatio;
  final double? textFont;

  const RoundedButton(
      {Key? key,
      required this.text,
      this.press,
      this.color = kAccentColor,
      this.textColor = Colors.white,
      this.textFont = 16,
      this.widthRatio = 0.5,
      this.heightRatio = 0.08})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double updatedTextFont = (textFont == null)
        ? displayHeight(context) * heightRatio * 0.42
        : textFont!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: displayHeight(context) / 140),
      width: displayWidth(context) * widthRatio,
      height: displayHeight(context) * heightRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(displayHeight(context) / 45),
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(color),
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: displayHeight(context) * heightRatio / 5,
                  horizontal: 5),
            ),
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: updatedTextFont),
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}
