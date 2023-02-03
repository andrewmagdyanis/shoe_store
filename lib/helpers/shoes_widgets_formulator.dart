import 'package:flutter/material.dart';
import 'package:shoe_store/colors_constants.dart';

List<Widget> formulateShoesWidgets(List<Map<String, dynamic>> paths, double dxImage) {
  List<Widget> widgets = paths
      .map(
        (e) => Container(
      height: 300,
      width: 265,
      margin: const EdgeInsets.only(right: 20),
      child: Stack(clipBehavior: Clip.none, children: [
        Center(
          child: Card(
            elevation: 1,
            color: e["color"],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          e["brand"],
                          style: const TextStyle(color: WHITE),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: WHITE,
                          ),
                        )
                      ],
                    ),
                    Text(
                      e["name"],
                      style: const TextStyle(
                        color: WHITE,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${e["price"]}",
                      style: const TextStyle(color: WHITE),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_rounded,
                            color: WHITE,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          left: dxImage,
          bottom: 5,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.transparent,
            child: Hero(
              tag: e["name"],
              transitionOnUserGestures: true,
              child: Image(
                height: 250,
                width: 205,
                image: AssetImage(e["image"]),
              ),
            ),
          ),
        ),
      ]),
    ),
  )
      .toList();
  return widgets;
}
