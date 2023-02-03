import 'package:flutter/material.dart';

class MoreListView extends StatelessWidget {
  const MoreListView({
    Key? key,
    required this.moreList,
  }) : super(key: key);

  final List<Widget> moreList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        child: Row(children: moreList),
      ),
    );
  }
}
