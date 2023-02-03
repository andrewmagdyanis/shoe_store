part of 'bag_list_cubit.dart';

@immutable
abstract class BagListState {}

class BagListInitial extends BagListState {}

class BagAddItem extends BagListState {}

class BagRemoveItem extends BagListState {}
