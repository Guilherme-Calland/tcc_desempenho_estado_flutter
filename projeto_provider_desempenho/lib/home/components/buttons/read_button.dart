import 'package:flutter/material.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class ReadButton extends StatelessWidget {

  const ReadButton();

  @override
  Widget build(BuildContext context) {

    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: () async{
        Desempenho.reset();
        itemProvider.readItems();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.reset();
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


