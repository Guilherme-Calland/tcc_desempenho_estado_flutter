import 'package:flutter/material.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class DeleteBtn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: () => itemProvider.deleteItem(),
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          itemProvider.deleteItem();
          await Desempenho.wait();
          if(itemProvider.itemList.isEmpty){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
