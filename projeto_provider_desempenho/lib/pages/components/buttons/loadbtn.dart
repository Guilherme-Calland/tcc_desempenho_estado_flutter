import 'package:flutter/material.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class LoadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: () async{
        itemProvider.readItems();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          itemProvider.readItems();
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


