import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_store/data_models/Shoe.dart';

part 'bag_list_state.dart';

class BagListCubit extends Cubit<BagListState> {
  BagListCubit() : super(BagListInitial());

  Map<String, dynamic> bagList = {};
  int totalCount = 0;
  double totalPrice = 0.0;

  static BagListCubit instance(BuildContext context) =>
      BlocProvider.of(context, listen: false);

  void addItem({required Shoe item, required Function animationAddItem}) {
    totalPrice += item.price;
    totalCount += 1;
    if (bagList.containsKey(item.name)) {
      bagList[item.name]["itemCount"] += 1;
    } else {
      bagList[item.name] = {"itemCount": 1, "item": item};
      animationAddItem();
    }
    emit(BagAddItem());
  }

  void removeItem({required Shoe item, required Function animationRemoveItem}) {
    if (totalPrice > 0) {
      totalPrice -= item.price;
    }
    if (totalCount > 0) {
      totalCount -= 1;
    }
    if (bagList.containsKey(item.name)) {
      if (bagList[item.name]["itemCount"] >1){
        bagList[item.name]["itemCount"] -=1;
      } else{
        animationRemoveItem();
        bagList.removeWhere((key, value) => key == item.name);
      }
    }

    emit(BagRemoveItem());
  }
}
