import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: () async{
        itemProvider.createItem();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          itemProvider.createItem();
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


