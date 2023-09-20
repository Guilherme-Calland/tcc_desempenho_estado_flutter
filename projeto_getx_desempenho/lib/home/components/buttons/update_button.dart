import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/model/recipe.dart';
import 'package:projeto_getx_desempenho/styles.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';

class UpdateButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onTap: (){
        Desempenho.reset();
        recipeController.updateItem();
      },
      onLongPress: ()async{
        Desempenho.reset();
        do{
          await Desempenho.wait();
          recipeController.updateItem();
        }while((){
          bool containsNotUpdated = false;
          recipeController.recipeList.cast<Recipe>().forEach((element) {
            if(!element.done){
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


