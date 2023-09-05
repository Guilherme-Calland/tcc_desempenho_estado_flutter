import 'dart:math';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/model/recipe.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';

class RecipeController extends GetxController{
  final RxList recipeList = [].obs;

  void createItem() {
    int index = Random().nextInt(Dados.recipes.length);
    Recipe estado = Recipe.fromJson(Dados.recipes[index]);
    Desempenho.salvarTempo('desempenho criando');
    recipeList.add(estado);
  }

  void readItems(){
    List<Recipe> tempList = Dados.recipes.map((e) => Recipe.fromJson(e)).toList();
    recipeList.clear();
    Desempenho.salvarTempo('desempenho carregando dados');
    recipeList.value = tempList;
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
    Desempenho.salvarTempo('desempenho atualizando');
    recipeList.value = tempList;
  }

  void deleteItem() {
    if(recipeList.isNotEmpty){
      Desempenho.salvarTempo('desempenho deletando');
      recipeList.removeLast();
    }
  }

  int randomize(int num) => Random().nextInt(num);

}