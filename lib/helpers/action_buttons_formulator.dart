import 'package:flutter/material.dart';

List<Widget> formulateActionsButtons(List<IconData> icons) {
  List<Widget> actionsButtons = icons
      .map(
        (e) => Container(
      margin: const EdgeInsets.only(right: 10, top: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        splashRadius: 22,
        iconSize: 28,
        color: Colors.black,
        icon: Icon(e),
      ),
    ),
  )
      .toList();
  return actionsButtons;
}
