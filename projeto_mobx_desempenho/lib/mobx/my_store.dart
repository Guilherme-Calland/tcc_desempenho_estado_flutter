import 'package:mobx/mobx.dart';
import '../data/dados.dart';
import '../model/recipe.dart';
import '../utils/performance.dart';

part 'my_store.g.dart';

class MyStore = _MyStore with _$MyStore;

abstract class _MyStore with Store{
  @observable
  ObservableList<Recipe> recipeList = ObservableList<Recipe>.of([]);

  @action
  createItem(Recipe item) {
    Desempenho.salvarTempo('desempenho criando');
    recipeList.add(item);
  }

  @action
  readItems() {
    recipeList.clear();
    Desempenho.salvarTempo('desempenho lendo');
    recipeList.addAll(Dados.recipes.map((e) => Recipe.fromJson(e)).toList());
  }

  @action
  updateItem() {
    List<Recipe> tempList = [];
    bool updated = false;
    recipeList.cast<Recipe>().forEach((element) {
      if(!element.done && !updated){
        updated = true;
        element.done = true;
      }
      tempList.add(element);
    });
    recipeList.clear();
    Desempenho.salvarTempo('desempenho atualizando');
    recipeList.addAll(tempList);
  }

  @action
  deleteItem() {
    if(recipeList.isNotEmpty){
      Desempenho.salvarTempo('desempenho excluíndo');
      recipeList.removeLast();
    }
  }
}

final myStore = MyStore();