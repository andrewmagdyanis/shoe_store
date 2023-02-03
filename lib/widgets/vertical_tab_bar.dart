import 'package:flutter/material.dart';

class VerticalTabBar extends StatelessWidget {
  const VerticalTabBar({
    Key? key,
    required this.verticalTabs,
  }) : super(key: key);

  final List<Widget> verticalTabs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: RotatedBox(
          quarterTurns: 3,
          child: TabBar(
            labelPadding: const EdgeInsetsDirectional.only(start: 30, end: 30),
            padding: const EdgeInsets.all(0),
            indicatorWeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorPadding: const EdgeInsets.all(0),
            indicator: const BoxDecoration(color: Colors.transparent),
            tabs: verticalTabs,
          ),
        ),
      ),
    );
  }
}
