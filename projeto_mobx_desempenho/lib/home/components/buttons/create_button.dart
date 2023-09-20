import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../data/dados.dart';
import '../../../model/recipe.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class CreateButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        Desempenho.reset();
        int index = Random().nextInt(Dados.recipes.length);
        Recipe estado = Recipe.fromJson(Dados.recipes[index]);
        myStore.createItem(estado);
      },
      onLongPress: ()async{
        Desempenho.reset();
        int i = 0;
        do{
          i++;
          int index = Random().nextInt(Dados.recipes.length);
          Recipe estado = Recipe.fromJson(Dados.recipes[index]);
          myStore.createItem(estado);
          await Desempenho.wait();
        }while(i < Desempenho.repeticoes);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


