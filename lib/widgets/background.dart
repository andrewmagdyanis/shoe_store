import 'dart:ui';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String assetImageLocation;

  const Background({
    Key? key,
    required this.child,
    required this.assetImageLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetImageLocation),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
    );
  }
}
