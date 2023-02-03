import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  const SizeButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final num size;

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Widget child = Center(
      child: Text(
        widget.size.toString(),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
    if (widget.size == 0) {
      child = Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              "Try it",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.airline_seat_legroom_extra,
              color: Colors.black,
            )
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        if (widget.size != 0) {
          setState(() {
            isClicked = !isClicked;
          });
        }
      },
      child: Container(
        width: 80,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isClicked ? Colors.black.withOpacity(0.7) : Colors.transparent,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: child,
      ),
    );
  }
}
