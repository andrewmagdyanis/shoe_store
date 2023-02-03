import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shoe_store/colors_constants.dart';
import 'package:shoe_store/data_models/Shoe.dart';
import 'package:shoe_store/helpers/action_buttons_formulator.dart';
import 'package:shoe_store/helpers/more_shoes_widgets_formulator.dart';
import 'package:shoe_store/helpers/navigation_bar_items_formulator.dart';
import 'package:shoe_store/helpers/tabs_fromulator.dart';
import 'package:shoe_store/widgets/bouncing_button.dart';
import 'package:shoe_store/widgets/hero_image.dart';
import 'package:shoe_store/widgets/horizontal_tab_bar.dart';
import 'package:shoe_store/widgets/more_list_header.dart';
import 'package:shoe_store/widgets/more_list_view.dart';
import 'package:shoe_store/widgets/vertical_tab_bar.dart';
import 'package:shoe_store/pages/detail_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Widget> brandShoes = [];
  List<Shoe> shoeDataList = [];
  List<Widget> moreList = [];
  List<BottomNavigationBarItem> navBarItems = [];
  List<Widget> actionsButtons = [];
  List<Widget> horizontalTabs = [];
  List<Widget> verticalTabs = [];
  List<Color> colors = [];
  late PageController _pageController;
  double dxImage = 0;
  double dThetaCard = 0;
  int currentPageIndex = 0;
  bool clicked = false;
  double pageOffset = 0;

  double viewportFraction = 0.78;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    shoeDataList = [
      Shoe(
          imagePath: "assets/images/sneaker_03.png",
          name: "AIR-270",
          brand: "Nike",
          color: const Color(0xDF0082A9),
          price: 180),
      Shoe(
          imagePath: "assets/images/sneaker_01.png",
          name: "AIR-MAX",
          brand: "Nike",
          color: const Color(0xDFFFA346),
          price: 150),
      Shoe(
          imagePath: "assets/images/sneaker_02.png",
          name: "AIR-Force",
          brand: "Nike",
          color: const Color(0xCFBE5687),
          price: 170),
      Shoe(
          imagePath: "assets/images/sneaker_04.png",
          name: "ZOOM",
          brand: "Nike",
          color: const Color(0xFFDCB700),
          price: 145),
    ];
    moreList = formulateMoreListWidgets(shoeDataList);
    navBarItems = formulateNavBarItems();
    actionsButtons = formulateActionsButtons([
      Icons.search,
      Icons.notifications_none,
    ]);
    horizontalTabs = formulatesTabs([
      "Nike",
      "Adidas",
      "Jordan",
      "Puma",
      "Rebook",
    ], textSize: 16);
    verticalTabs = formulatesTabs([
      "New",
      "Featured",
      "Upcoming",
    ], textSize: 12);

    super.initState();

    _pageController = PageController(viewportFraction: viewportFraction)
      ..addListener(() {
        double pagePortion = _pageController.page!;
        setState(() {
          pageOffset = pagePortion;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          title: const Text(
            "Discover",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.black,
            ),
          ),
          actions: actionsButtons,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: HorizontalTabBar(horizontalTabs: horizontalTabs)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: navBarItems,
          selectedFontSize: 12,
          elevation: 0,
          iconSize: 22,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Row(children: [
                  VerticalTabBar(verticalTabs: verticalTabs),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        height: 300,
                        child: PageView.builder(
                            itemCount: 4,
                            physics: const ClampingScrollPhysics(),
                            padEnds: false,
                            allowImplicitScrolling: true,
                            controller: _pageController,
                            onPageChanged: (int index) {
                              setState(() {
                                currentPageIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              Shoe e = shoeDataList[index];

                              double rotationAngle = (pageOffset - index).abs();
                              if (rotationAngle > 0.5) {
                                rotationAngle = 1 - rotationAngle;
                              }

                              double scale = max(
                                  viewportFraction,
                                  (1 - (pageOffset - index).abs()) +
                                      viewportFraction);

                              double leftOffset =
                                  ((pageOffset - currentPageIndex).abs() > 0.1)
                                      ? 5
                                      : 35 -
                                          (pageOffset - currentPageIndex)
                                                  .abs() *
                                              300;

                              return Transform(
                                alignment: Alignment.bottomCenter,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001) // Perspective
                                  ..rotateY((index == currentPageIndex)
                                      ? -rotationAngle
                                      : rotationAngle),
                                // Rotation about Y-Axis
                                child: Container(
                                  height: 320,
                                  width: 265,
                                  padding: EdgeInsets.only(
                                      top: 30 - scale * 15, bottom: 0),
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Center(
                                        child: Card(
                                          elevation: 1,
                                          color: e.color,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            height: 310,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 14.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        e.brand,
                                                        style: const TextStyle(
                                                            color: WHITE),
                                                      ),
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.favorite_border,
                                                          color: WHITE,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    e.name,
                                                    style: const TextStyle(
                                                      color: WHITE,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "\$${e.price}",
                                                    style: const TextStyle(
                                                        color: WHITE),
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons
                                                              .arrow_forward_rounded,
                                                          color: WHITE,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AnimatedPositioned(
                                        left: leftOffset,
                                        bottom: 5,
                                        duration:
                                            const Duration(milliseconds: 20),
                                        curve: Curves.linear,
                                        child: BouncingButton(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(shoe: e),
                                              ),
                                            );
                                          },
                                          child: HeroImage(e: e),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ]),
              ),
              const MoreListHeader(),
              MoreListView(moreList: moreList),
            ],
          ),
        ),
      ),
    );
  }
}
