import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dados.dart';
import '../model/recipe.dart';
import '../utils/performance.dart';

class ItemController extends ChangeNotifier{
  final List<Recipe> recipeList = [];

  static ItemController getProvider(BuildContext context) => Provider.of<ItemController>(context, listen: false);

  void createItem() {
    int index = Random().nextInt(Dados.recipes.length);
    Recipe recipe = Recipe.fromJson(Dados.recipes[index]);
    recipeList.add(recipe);
    Desempenho.salvarTempo('desempenho criando');
    notifyListeners();
  }

  void readItems(){
    List<Recipe> tempList = Dados.recipes.map((e) => Recipe.fromJson(e)).toList();
    recipeList.clear();
    recipeList.addAll(tempList);
    Desempenho.salvarTempo('desempenho carregando dados');
    notifyListeners();
  }

  void updateItem() {

    List<Recipe> tempList = [];
    bool updatedOne = false;
    recipeList.cast<Recipe>().forEach((element) {
      if(!element.done && !updatedOne){
        updatedOne = true;
        element.done = true;
      }
      tempList.add(element);
    });
    recipeList.clear();
    recipeList.addAll(tempList);
    Desempenho.salvarTempo('desempenho atualizando');
    notifyListeners();
  }

  void deleteItem() {
    if(recipeList.isNotEmpty){
      recipeList.removeLast();
      Desempenho.salvarTempo('desempenho deletando');
      notifyListeners();
    }
  }

  int randomize(int num) => Random().nextInt(num);

  void clearList() {
    recipeList.clear();
    notifyListeners();
  }

}