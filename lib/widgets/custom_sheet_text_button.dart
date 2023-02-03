import 'package:flutter/material.dart';
import 'package:shoe_store/colors_constants.dart';

class CustomSheetTextButton extends StatelessWidget {
  const CustomSheetTextButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 60,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              return kAccentColor;
            }),
          ),
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
