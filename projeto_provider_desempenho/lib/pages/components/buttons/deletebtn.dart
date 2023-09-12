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
      onTap: (){
        Desempenho.reset();
        itemProvider.deleteItem();
      },
      onDoubleTap: (){
        itemProvider.clearList();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.reset();
        do{
          itemProvider.deleteItem();
          await Desempenho.wait();
          if(itemProvider.recipeList.isEmpty){
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
