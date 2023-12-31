import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/styles.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';


class DeleteButton extends StatelessWidget {

  const DeleteButton();

  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onDoubleTap: (){
        recipeController.recipeList.clear();
      },
      onTap: (){
        Desempenho.reset();
        recipeController.deleteItem();
      },
      
      onLongPress: ()async{
        bool finished = false;
        Desempenho.reset();
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
