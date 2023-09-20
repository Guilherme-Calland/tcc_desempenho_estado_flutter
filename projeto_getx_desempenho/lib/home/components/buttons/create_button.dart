import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/styles.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';

class CreateButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onTap: () async{
        Desempenho.reset();
        recipeController.createItem();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.reset();
        do{
          recipeController.createItem();
          await Desempenho.wait();
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


