import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_getx_desempenho/controllers/item_controller.dart';

import '../controllers/index_controller.dart';

class UtilMethods{
  static getControllerInstance(int index){
    switch(index){
      case 0:
        return ItemController(); 
    }
  }

  static findController() {
    int index = Get.find<IndexController>().currentIndex.value;

    switch(index){
      case 0:
        return Get.find<ItemController>();
    }
  }
}