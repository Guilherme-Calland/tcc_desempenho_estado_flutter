import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => myStore.updateItem(),
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        do{
          await Desempenho.wait();
          myStore.updateItem();
        }while((){
          bool containsNotUpdated = false;
          myStore.itemList.cast<Estado>().forEach((element) {
            if(!element.nome.contains("(atualizado)")){
              containsNotUpdated = true;
            }
          });
          return containsNotUpdated;
        }());
        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


