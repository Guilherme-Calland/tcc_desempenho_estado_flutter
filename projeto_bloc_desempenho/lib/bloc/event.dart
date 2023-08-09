import '../model/estado.dart';

abstract class ItemEvent{}

class CreateItemEvent extends ItemEvent{
  Estado item;
  CreateItemEvent({
    required this.item
  });
}

class ReadItemEvent extends ItemEvent{}

class UpdateItemEvent extends ItemEvent{}

class DeleteItemEvent extends ItemEvent{}