import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../model/recipe.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class UpdateButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onTap: (){
        recipeController.updateItem();
      },
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
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


