
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:projeto_bloc_desempenho/utils/performance.dart';

import '../data/dados.dart';
import '../model/estado.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState>{

  final List<Estado> _itemList = [];

  ItemBloc() : super(ItemInitialState()){
    on<CreateItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _createItem(event.item))));
    on<ReadItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _readItems())));
    on<UpdateItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _updateItem())));
    on<DeleteItemEvent>((event, emit) => emit(ItemSuccessState(itemList: _deleteItem())));
  }
  
  _createItem(Estado item) {
    _itemList.add(item);
    Desempenho.salvarTempo('desempenho criando');
    return _itemList;
  }
  
  _readItems() {
    _itemList.clear();
    _itemList.addAll(Dados.estados.map((e) => Estado.fromJson(e)).toList());
    Desempenho.salvarTempo('desempenho lendo');
    return _itemList;
  }

  _updateItem() {
    List<Estado> tempList = [];
    bool updated = false;
    _itemList.forEach((element) {
      if(!element.nome.contains("(atualizado)") && !updated){
        updated = true;
        element.nome += ' (atualizado)';
        element.cidades = element.cidades.reversed.toList();
      }
      tempList.add(element);
    });
    _itemList.clear();
    _itemList.addAll(tempList);
    Desempenho.salvarTempo('desempenho atualizando');
    return _itemList;
  }
  
  _deleteItem() {
    if(_itemList.isNotEmpty){
      _itemList.removeLast();
    }
    Desempenho.salvarTempo('desempenho excluíndo');
    return _itemList;
  }
}

