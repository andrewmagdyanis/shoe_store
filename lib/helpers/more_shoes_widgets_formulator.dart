import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoe_store/colors_constants.dart';
import 'package:shoe_store/data_models/Shoe.dart';

List<Widget> formulateMoreListWidgets(List<Shoe> paths) {
  List<Widget> widgets = paths
      .map(
        (e) => Container(
          height: 260,
          width: 170,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Container(
                                  width: 50,
                                  margin:
                                      const EdgeInsets.only(top: 10, right: 12),
                                  color: kAccentColor,
                                  child: const Text(
                                    "New",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: WHITE),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          e.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${e.price}",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                bottom: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Transform.rotate(
                    angle: pi / 6.7,
                    child: Image(
                      height: 170,
                      width: 130,
                      image: AssetImage(e.imagePath),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      .toList();
  return widgets;
}
