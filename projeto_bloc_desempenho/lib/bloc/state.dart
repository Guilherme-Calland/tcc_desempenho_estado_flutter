import '../model/item.dart';

abstract class ItemState{
  List<ItemModel> items;

  ItemState({
    required this.items
  });
}

class ItemInitialState extends ItemState{
  ItemInitialState() : super(items: []);
}

class ItemSuccessState extends ItemState{
  ItemSuccessState({required List<ItemModel> items}) : super(items: items);
}