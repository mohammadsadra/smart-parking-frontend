import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;

  changePageIndex(index) {
    pageIndex.value = index;
    update();
  }
}
