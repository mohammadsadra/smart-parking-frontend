import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Services/parking_services.dart';

class ParkingController extends GetxController {
  RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  RxList<Parking> allParking = <Parking>[].obs;
  RxList<Parking> notVerifiedParking = <Parking>[].obs;
  RxString search = ''.obs;

  Future getAllParking() async {
    _isLoading.value = true;
    update();
    var response = ParkingService().getAllParking();
    response.then(
      (value) {
        for (Parking park in value) {
          if (park.is_verified!) {
            allParking.add(park);
          } else {
            notVerifiedParking.add(park);
          }
        }
        _isLoading.value = false;
        update();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getAllParking();
  }
}
