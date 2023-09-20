import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'components/buttons/create_button.dart';
import 'components/buttons/delete_button.dart';
import 'components/buttons/read_button.dart';
import 'components/buttons/update_button.dart';
import 'components/list.dart';
import 'components/scaffold.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(RecipeController());

    return const ScreenScaffold(
      itemList: ItemList(),
      createButton: CreateButton(),
      readButton: ReadButton(),
      updateButton: UpdateButton(),
      deleteButton: DeleteButton(),
    );
  }
}



