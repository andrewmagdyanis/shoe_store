import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_store/data_models/Shoe.dart';
import 'package:shoe_store/state_management/bag_list_cubit.dart';
import 'package:shoe_store/widgets/custom_sheet_text_button.dart';
import 'package:shoe_store/widgets/animated_item.dart';

class BagPage extends StatefulWidget {
  const BagPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
      listKey.currentState!.insertItem(
        0,
        duration: const Duration(milliseconds: 750),
      );
    });

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   print("SchedulerBinding");
    //   listKey.currentState!.insertItem(
    //     0,
    //     duration: const Duration(milliseconds: 750),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BagListCubit, BagListState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        BagListCubit bagListCubit = BagListCubit.instance(context);

        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text(
                      "My Bag",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Spacer(),
                    Text(
                      "Total ${bagListCubit.totalCount} items",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "TOTAL",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${bagListCubit.totalPrice}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomSheetTextButton(
                  onPressed: () {},
                  buttonText: 'NEXT',
                ),
                const Spacer(),
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 280,
                  child: AnimatedList(
                    reverse: false,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    key: listKey,
                    initialItemCount: bagListCubit.bagList.keys.length,
                    itemBuilder: (BuildContext context, int index,
                        Animation<double> animation) {
                      List shoeList = bagListCubit.bagList.values
                          .toList()
                          .reversed
                          .toList();
                      if (index < shoeList.length) {
                        Shoe shoe = shoeList[index]["item"];

                        return AnimatedItem(
                          key: UniqueKey(),
                          itemCount: bagListCubit.bagList[shoe.name]
                              ["itemCount"],
                          shoe: shoe,
                          animation: animation,
                          onAddClick: () {
                            bagListCubit.addItem(
                              item: shoe,
                              animationAddItem: () {
                                listKey.currentState!.insertItem(
                                  0,
                                  duration: const Duration(milliseconds: 750),
                                );
                              },
                            );
                          },
                          onRemoveClick: () {
                            bagListCubit.removeItem(
                              item: shoe,
                              animationRemoveItem: () {
                                Shoe removeItem =
                                    bagListCubit.bagList[shoe.name]["item"];
                                listKey.currentState!.removeItem(
                                  index,
                                  (context, animation) => AnimatedItem(
                                    itemCount: 1,
                                    shoe: removeItem,
                                    animation: animation,
                                    onAddClick: () {},
                                    onRemoveClick: () {},
                                  ),
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
