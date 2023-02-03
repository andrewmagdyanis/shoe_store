import 'package:flutter/material.dart';

class HorizontalTabBar extends StatelessWidget {
  const HorizontalTabBar({
    Key? key,
    required this.horizontalTabs,
  }) : super(key: key);

  final List<Widget> horizontalTabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        indicatorPadding: const EdgeInsets.all(10),
        indicatorWeight: 10,
        indicator: BoxDecoration(color: Colors.grey.shade300),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.black,
        tabs: horizontalTabs);
  }
}
