import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/styles.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';

class ReadButton extends StatelessWidget {

  const ReadButton();

  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return MyButton(
      onTap: () async{
        Desempenho.reset();
        recipeController.readItems();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.reset();
        do{
          recipeController.readItems();
          await Desempenho.wait();
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: readColor,
      icon: Icons.list,
    );
  }
}


