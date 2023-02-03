import 'package:flutter/material.dart';

List<Widget> formulatesTabs(List<String> tabsLabels,
    {required double textSize}) {
  return tabsLabels
      .map(
        (e) => Text(
      e,
      overflow: TextOverflow.fade,
      maxLines: 1,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  )
      .toList();
}
