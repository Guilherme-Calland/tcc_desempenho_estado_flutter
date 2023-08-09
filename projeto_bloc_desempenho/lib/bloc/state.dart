import '../model/estado.dart';

abstract class ItemState{
  List<Estado> itemList = [];

  ItemState({
    required this.itemList
  });
}

class ItemInitialState extends ItemState{
  ItemInitialState() : super(itemList: []);
}

class ItemSuccessState extends ItemState{
  ItemSuccessState({required List<Estado> itemList}) : super(itemList: itemList);
}