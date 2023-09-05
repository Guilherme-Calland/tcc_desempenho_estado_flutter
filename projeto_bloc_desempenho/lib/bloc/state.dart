
import '../model/recipe.dart';

abstract class ItemState{
  List<Recipe> recipeList = [];

  ItemState({
    required this.recipeList
  });
}

class ItemInitialState extends ItemState{
  ItemInitialState() : super(recipeList: []);
}

class ItemSuccessState extends ItemState{
  ItemSuccessState({required List<Recipe> recipeList}) : super(recipeList: recipeList);
}