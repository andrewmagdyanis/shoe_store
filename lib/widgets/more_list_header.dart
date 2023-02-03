import 'package:flutter/material.dart';

class MoreListHeader extends StatelessWidget {
  const MoreListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 300,
        padding: const EdgeInsets.only(left: 16.0),
        child: const Text(
          "More",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const Spacer(),
      IconButton(
        onPressed: () {},
        padding: const EdgeInsets.all(0),
        splashRadius: 20,
        icon: const Icon(
          Icons.arrow_forward_sharp,
          color: Colors.black,
        ),
      )
    ]);
  }
}
