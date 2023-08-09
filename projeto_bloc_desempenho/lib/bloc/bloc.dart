
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/bloc/state.dart';
import 'package:bloc/bloc.dart';

import '../data/dados.dart';
import '../model/estado.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState>{

  final List<Estado> _itemList = [];

  ItemBloc() : super(ItemInitialState()){
    on<CreateItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _createItem(event.item))));
    on<ReadItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _readItems())));
    on<UpdateItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _updateItem(event.item))));
    on<DeleteItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _deleteItem(event.item))));
  }
  
  _createItem(Estado item) {
    _itemList.add(item);
    return _itemList;
  }
  
  _readItems() {
    _itemList.clear();
    _itemList.addAll(Dados.estados.map((e) => Estado.fromJson(e)).toList());
    return _itemList;
  }

  _updateItem(Estado item) {
    List<Estado> tempList = [];
    _itemList.forEach((element) {
      if(element.nome == item.nome){
        element.nome += ' (atualizado)';
        element.cidades = item.cidades.reversed.toList();
      }
      tempList.add(element);
    });
    _itemList.clear();
    _itemList.addAll(tempList);
    return _itemList;
  }
  
  _deleteItem(Estado item) {
    _itemList.remove(item);
    return _itemList;
  }
}

