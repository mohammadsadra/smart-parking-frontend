import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;
  var location = Location();
  LocationData? locAtrr;

  changePageIndex(index) {
    pageIndex.value = index;
    update();
  }

  Future initLocationService() async {
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    locAtrr = await location.getLocation();
    print("${locAtrr!.latitude} ${locAtrr!.longitude}");
  }
}
