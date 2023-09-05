import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/blocs/bloc/event.dart';
import '../../../../data/dados.dart';
import '../../../../main.dart';
import '../../../../model/recipe.dart';
import '../../../../styles.dart';
import '../../../../utils/performance.dart';
import '../../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        int index = Random().nextInt(Dados.recipes.length);
        Recipe recipe = Recipe.fromJson(Dados.recipes[index]);
        bloc.add(CreateItemEvent(recipe: recipe));
      },
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        int i = 0;
        do{
          i++;
          int index = Random().nextInt(Dados.recipes.length);
          Recipe recipe = Recipe.fromJson(Dados.recipes[index]);
          bloc.add(CreateItemEvent(recipe: recipe));
          await Desempenho.wait();
        }while(i < 100);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


