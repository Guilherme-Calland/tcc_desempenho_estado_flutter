import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';

class DeleteButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onTap: () => recipeController.deleteItem(),
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          recipeController.deleteItem();
          await Desempenho.wait();
          if(recipeController.recipeList.isEmpty){
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
