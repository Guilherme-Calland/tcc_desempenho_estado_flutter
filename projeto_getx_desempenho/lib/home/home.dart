import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'components/buttons/create_button.dart';
import 'components/loadbtn.dart';
import 'components/updatebtn.dart';
import 'components/deletebtn.dart';
import 'components/list.dart';
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



