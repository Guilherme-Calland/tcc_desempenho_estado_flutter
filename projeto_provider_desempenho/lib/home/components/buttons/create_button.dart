import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class CreateButton extends StatelessWidget {

  const CreateButton();

  @override
  Widget build(BuildContext context) {
    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: () async{
        Desempenho.reset();
        itemProvider.createItem();
      },
      onLongPress: ()async{
        Desempenho.reset();
        bool finished = false;
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


