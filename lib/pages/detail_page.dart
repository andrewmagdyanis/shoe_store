import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoe_store/colors_constants.dart';
import 'package:shoe_store/data_models/Shoe.dart';
import 'package:shoe_store/pages/bag_page.dart';
import 'package:shoe_store/state_management/bag_list_cubit.dart';
import 'package:shoe_store/widgets/custom_sheet_text_button.dart';
import 'package:shoe_store/widgets/hero_image.dart';
import 'package:shoe_store/widgets/size_button.dart';

class DetailPage extends StatefulWidget {
  final Shoe shoe;

  const DetailPage({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: CustomShapeBorder2(),
          toolbarHeight: 110,
          iconTheme: const IconThemeData(color: WHITE),
          backgroundColor: widget.shoe.color,
          title: Text(
            widget.shoe.brand,
            style: const TextStyle(
              color: WHITE,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.65),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: WHITE,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.5 * kToolbarHeight),
            child: SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: 30,
                    child: HeroImage(
                      height: 270,
                      width: 290,
                      e: widget.shoe,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 80,
                      height: 55,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Transform(
                        transform: Matrix4.identity()..rotateZ(pi / 6.5),
                        alignment: Alignment.center,
                        child: Image.asset(widget.shoe.imagePath),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..rotateZ(-pi / 6.5)
                          ..rotateY(pi),
                        alignment: Alignment.center,
                        child: Image.asset(widget.shoe.imagePath),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 55,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..rotateZ(pi / 6.5)
                          ..rotateX(pi),
                        alignment: Alignment.center,
                        child: Image.asset(widget.shoe.imagePath),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 55,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..rotateZ(pi / 6.5)
                          ..rotateY(-pi),
                        alignment: Alignment.center,
                        child: Image.asset(widget.shoe.imagePath),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    widget.shoe.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "\$${widget.shoe.price.toString()}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.shoe.description ?? "",
                style: const TextStyle(color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "MORE DETAILS",
                  style: TextStyle(
                    fontSize: 12,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, -5),
                      )
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "Size",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "UK",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "USA",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    List sizes = [0, 7.5, 8, 9.5];

                    return SizeButton(size: sizes[index]);
                  },
                ),
              ),
              const Spacer(),
              CustomSheetTextButton(
                onPressed: () {
                  BagListCubit.instance(context)
                      .addItem(item: widget.shoe, animationAddItem: () {});
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BagPage(),
                    ),
                  );
                },
                buttonText: 'ADD TO PAGE',
              ),
              const Spacer()
            ],
          ),
        ));
  }
}

class CustomShapeBorder1 extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const double innerCircleRadius = 150.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
        rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75,
        rect.height + 50);
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
        rect.height + 15, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}

class CustomShapeBorder2 extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    path.lineTo(0, rect.height / 2);
    path.arcToPoint(
      Offset(rect.width, rect.height * 2 / 3),
      radius: const Radius.circular(250),
      clockwise: false,
    );
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
