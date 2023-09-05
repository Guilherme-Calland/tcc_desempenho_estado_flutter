
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:projeto_bloc_desempenho/utils/performance.dart';
import '../data/dados.dart';
import '../model/recipe.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState>{

  final List<Recipe> _recipeList = [];

  ItemBloc() : super(ItemInitialState()){
    on<CreateItemEvent>((event, emit) => emit(ItemSuccessState(recipeList: _createItem(event.recipe))));
    on<ReadItemEvent>((event, emit) => emit(ItemSuccessState(recipeList: _readItems())));
    on<UpdateItemEvent>((event, emit) => emit(ItemSuccessState(recipeList: _updateItem())));
    on<DeleteItemEvent>((event, emit) => emit(ItemSuccessState(recipeList: _deleteItem())));
  }
  
  _createItem(Recipe item) {
    _recipeList.add(item);
    Desempenho.salvarTempo('desempenho criando');
    return _recipeList;
  }
  
  _readItems() {
    _recipeList.clear();
    _recipeList.addAll(Dados.recipes.map((e) => Recipe.fromJson(e)).toList());
    Desempenho.salvarTempo('desempenho lendo');
    return _recipeList;
  }

  _updateItem() {

    List<Recipe> tempList = [];
    bool updated = false;
    _recipeList.cast<Recipe>().forEach((element) {
      if(!element.done && !updated){
        updated = true;
        element.done = true;
      }
      tempList.add(element);
    });

    _recipeList.clear();
    _recipeList.addAll(tempList);
    Desempenho.salvarTempo('desempenho atualizando');
    return _recipeList;
  }
  
  _deleteItem() {
    if(_recipeList.isNotEmpty){
      _recipeList.removeLast();
    }
    Desempenho.salvarTempo('desempenho excluíndo');
    return _recipeList;
  }
}

