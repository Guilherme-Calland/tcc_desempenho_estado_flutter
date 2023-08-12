import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../data/dados.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        int index = Random().nextInt(Dados.estados.length);
        Estado estado = Estado.fromJson(Dados.estados[index]);
        myStore.createItem(estado);
      },
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        int i = 0;
        do{
          i++;
          int index = Random().nextInt(Dados.estados.length);
          Estado estado = Estado.fromJson(Dados.estados[index]);
          myStore.createItem(estado);
          await Desempenho.wait();
        }while(i < 100);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


