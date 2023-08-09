import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';
import 'package:projeto_getx_desempenho/pages/components/buttons/loadbtn.dart';
import 'package:projeto_getx_desempenho/pages/components/buttons/updatebtn.dart';
import 'package:projeto_getx_desempenho/styles.dart';
import 'components/buttons/createbtn.dart';
import 'components/buttons/deletebtn.dart';
import 'components/list.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(ItemController());

    return Scaffold(
      floatingActionButton:
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CreateBtn(),
              SizedBox(width: 4),
              LoadButton(),
              SizedBox(width: 4),
              UpdateBtn(),
              SizedBox(width: 4),
              DeleteBtn(),
          
            ],
          ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
            ),
            
            Expanded(
              child: ItemList(),
            ),
                  ],
                ),
          )),
    );
  }
}



