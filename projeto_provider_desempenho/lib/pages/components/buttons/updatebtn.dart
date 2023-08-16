import 'package:flutter/material.dart';
import '../../../controllers/item_controller.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: (){
        itemProvider.updateItem();
      },
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        do{
          await Desempenho.wait();
          itemProvider.updateItem();
        }while((){
          bool containsNotUpdated = false;
          itemProvider.itemList.cast<Estado>().forEach((element) {
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


