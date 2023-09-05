import 'package:projeto_bloc_desempenho/model/recipe.dart';

abstract class ItemEvent{}

class CreateItemEvent extends ItemEvent{
  Recipe recipe;
  CreateItemEvent({
    required this.recipe
  });
}

class ReadItemEvent extends ItemEvent{}

class UpdateItemEvent extends ItemEvent{}

class DeleteItemEvent extends ItemEvent{}