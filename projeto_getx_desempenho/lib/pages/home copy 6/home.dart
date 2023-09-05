import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/pages/home copy 6/components/loadbtn.dart';
import 'package:projeto_getx_desempenho/pages/home copy 6/components/updatebtn.dart';
import 'components/createbtn.dart';
import 'components/deletebtn.dart';
import '../recipe/list.dart';
import 'components/scaffold.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(RecipeController());

    return ScreenScaffold(
      itemList: ItemList(),
      createButton: CreateButton(),
      readButton: ReadButton(),
      updateButton: UpdateButton(),
      deleteButton: DeleteButton(),
    );
  }
}



