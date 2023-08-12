import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class DeleteBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => myStore.deleteItem(),
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        int i = 0;
        do{
          i++;
          myStore.deleteItem();
          await Desempenho.wait();
        }while(i < 100);
        await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
