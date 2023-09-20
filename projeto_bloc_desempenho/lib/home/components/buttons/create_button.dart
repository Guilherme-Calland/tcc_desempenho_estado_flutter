import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/blocs/bloc/event.dart';
import '../../../data/dados.dart';
import '../../../main.dart';
import '../../../model/recipe.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class CreateButton extends StatelessWidget {

  const CreateButton();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        Desempenho.reset();
        int index = Random().nextInt(Dados.recipes.length);
        Recipe recipe = Recipe.fromJson(Dados.recipes[index]);
        bloc.add(CreateItemEvent(recipe: recipe));
      },
      onLongPress: ()async{
        Desempenho.reset();
        int i = 0;
        do{
          i++;
          int index = Random().nextInt(Dados.recipes.length);
          Recipe recipe = Recipe.fromJson(Dados.recipes[index]);
          bloc.add(CreateItemEvent(recipe: recipe));
          await Desempenho.wait();
        }while(i < Desempenho.repeticoes);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


