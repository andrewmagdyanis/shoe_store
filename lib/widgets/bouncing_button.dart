import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final void Function()? onTap;

  const BouncingButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.15,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Center(
      child: GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ),
      ),
    );
  }

  Widget _animatedButton(Widget child) {
    return Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 12.0,
                offset: Offset(0.0, 5.0),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff33ccff),
                Color(0xffff99cc),
              ],
            )),
        child: child);
  }

  void _tapDown(TapDownDetails details) {
    print("tapdown");
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    print("tapup");
    _controller.reverse().whenComplete(() {
      if (widget.onTap != null) {
        widget.onTap!();
      }
    });
  }
}
