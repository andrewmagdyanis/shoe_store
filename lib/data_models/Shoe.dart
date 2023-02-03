import 'package:flutter/material.dart';

class Shoe {
  final String imagePath;
  String name;
  final String brand;
  final Color color;
  final num price;
  final String? description;

  Shoe({
    required this.imagePath,
    required this.name,
    required this.brand,
    required this.color,
    required this.price,
    this.description,
  });

  void changeName(String newName) {
    name = newName;
  }
}
