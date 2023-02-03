import 'package:flutter/material.dart';

List<BottomNavigationBarItem> formulateNavBarItems() {
  return [
    const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: ""),
    const BottomNavigationBarItem(
        icon: Icon(Icons.house_outlined), label: ""),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: ""),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_outlined), label: ""),
  ];
}
