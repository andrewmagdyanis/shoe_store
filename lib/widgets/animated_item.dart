import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoe_store/data_models/Shoe.dart';

class AnimatedItem extends StatefulWidget {
  const AnimatedItem({
    Key? key,
    required this.shoe,
    required this.animation,
    required this.onAddClick,
    required this.onRemoveClick,
    required this.itemCount
  }) : super(key: key);

  final Shoe shoe;
  final int itemCount;
  final Animation<double> animation;
  final void Function()? onAddClick;
  final void Function()? onRemoveClick;

  @override
  State<AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> {

  @override
  Widget build(BuildContext context) {
    // Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 1));
    Tween<double> scale = Tween(begin: 0.0, end: 1.0);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          ScaleTransition(
            key: UniqueKey(),
            scale: widget.animation.drive(scale),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 145,
                  width: 145,
                  child: Image.asset(widget.shoe.imagePath),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.485,
            child: ScaleTransition(
              key: UniqueKey(),
              scale: widget.animation.drive(scale),
              child: FadeTransition(
                key: UniqueKey(),
                opacity: widget.animation.drive(scale),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ListTile(
                    title: Text(
                      widget.shoe.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${widget.shoe.price.toString()}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              color: Colors.grey.shade200,
                              child: IconButton(
                                splashRadius: 10,
                                onPressed: widget.onRemoveClick!,
                                icon: const Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Text("${widget.itemCount}"),
                            ),
                            Container(
                              height: 30,
                              color: Colors.grey.shade200,
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: widget.onAddClick!,
                                icon: const Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
