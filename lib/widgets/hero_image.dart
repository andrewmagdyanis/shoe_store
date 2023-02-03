import 'package:flutter/material.dart';
import 'package:shoe_store/data_models/Shoe.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    required this.e,
    this.height,
    this.width,
  }) : super(key: key);

  final Shoe e;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Hero(
        tag: e.name,
        transitionOnUserGestures: true,
        child: Image(
          height: height ?? 235,
          width: width ?? 200,
          image: AssetImage(e.imagePath),
        ),
      ),
    );
  }
}
