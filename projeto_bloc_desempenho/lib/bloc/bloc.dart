import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/state.dart';

import '../model/item.dart';
import 'event.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState>{
  final List<ItemModel> _itemList = [];

  ItemBloc() : super(ItemInitialState()){
    on<AddItemEvent>((event, emit) => emit(ItemSuccessState(items: _addItem(event.item))));
    on<RemoveItemEvent>((event, emit) => emit(ItemSuccessState(items: _removeItem())));
    on<AddItemEvent>((event, emit) => emit(ItemSuccessState(items: _updateItem())));
  }
  
  _addItem(ItemModel item) {
    _itemList.add(item);
    return _itemList;
  }

  
  _removeItem() {
    _itemList.removeLast();
    return _itemList;
  }
  
  _updateItem() {
    List<ItemModel> tempList = [];

    bool updatedOne = false;
    _itemList.cast<ItemModel>().forEach((element) {
      if(!element.estado.nome.contains("(atualizado)") && !updatedOne){
        updatedOne = true;
        element.estado.nome += " (atualizado)";
        element.corBorda = Colors.white;
      }
      tempList.add(element);
    });

    _itemList.clear();
    _itemList.addAll(tempList);
  }
}