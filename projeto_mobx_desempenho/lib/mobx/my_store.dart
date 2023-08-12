import 'package:mobx/mobx.dart';
import 'package:projeto_mobx_desempenho/model/estado.dart';

import '../data/dados.dart';
import '../utils/performance.dart';

part 'my_store.g.dart';

class MyStore = _MyStore with _$MyStore;

abstract class _MyStore with Store{
  @observable
  ObservableList<Estado> itemList = ObservableList<Estado>.of([]);

  @action
  createItem(Estado item) {
    Desempenho.salvarTempo('desempenho criando');
    itemList.add(item);
  }

  @action
  readItems() {
    itemList.clear();
    Desempenho.salvarTempo('desempenho lendo');
    itemList.addAll(Dados.estados.map((e) => Estado.fromJson(e)).toList());
  }

  @action
  updateItem() {
    List<Estado> tempList = [];
    bool updated = false;
    itemList.forEach((element) {
      if(!element.nome.contains("(atualizado)") && !updated){
        updated = true;
        element.nome += ' (atualizado)';
        element.cidades = element.cidades.reversed.toList();
      }
      tempList.add(element);
    });
    itemList.clear();
    Desempenho.salvarTempo('desempenho atualizando');
    itemList.addAll(tempList);
  }

  @action
  deleteItem() {
    if(itemList.isNotEmpty){
      Desempenho.salvarTempo('desempenho excluíndo');
      itemList.removeLast();
    }
  }
}

final myStore = MyStore();