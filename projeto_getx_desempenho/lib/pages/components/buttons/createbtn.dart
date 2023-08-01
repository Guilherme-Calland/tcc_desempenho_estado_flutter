import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {
  CreateBtn({
    super.key,
  });

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        for(int i = 0; i < Desempenho.repeticoes; i++){
          _itemController.createOne();
          await Future.delayed(Duration(milliseconds: 100));
        }
      },
      onLongPress: ()async{
        for(int i = 0; i < Desempenho.repeticoes; i++){
          _itemController.createMany(Desempenho.repeticoes);
          await Future.delayed(Duration(milliseconds: 100));
        }
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


