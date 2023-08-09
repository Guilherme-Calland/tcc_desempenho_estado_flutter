import '../model/item.dart';

abstract class ItemEvent{}

class AddItemEvent extends ItemEvent{
  ItemModel item;
  AddItemEvent({required this.item});
}

class RemoveItemEvent extends ItemEvent{
  ItemModel item;
  RemoveItemEvent({required this.item});
}

class UpdateItemEvent extends ItemEvent{
  ItemModel item;
  UpdateItemEvent({required this.item});
}

