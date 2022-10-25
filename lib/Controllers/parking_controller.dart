import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Services/parking_services.dart';

class ParkingController extends GetxController {
  RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  RxBool addParkingLoading = false.obs;
  RxBool updateIsVerify = false.obs;

  RxList<Parking> allParking = <Parking>[].obs;
  RxList<Parking> notVerifiedParking = <Parking>[].obs;
  RxString search = ''.obs;

  RxString name = ''.obs,
      description = ''.obs,
      address = ''.obs,
      phone = ''.obs,
      working_hours = ''.obs,
      working_days = ''.obs,
      picture = ''.obs;
  RxDouble latitude = 0.0.obs, longitude = 0.0.obs, cost = 0.0.obs;
  RxInt total_capacity = 0.obs;
  RxInt row = 1.obs, column = 1.obs;
  var list = [].obs;

  Future getAllParking() async {
    _isLoading.value = true;
    allParking.value = [];
    notVerifiedParking.value = [];
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

  Future addParking(
    name,
    description,
    address,
    phone,
    total_capacity,
    latitude,
    longitude,
    cost,
    working_hours,
    working_days,
    picture,
    owner_id,
  ) async {
    addParkingLoading.value = true;
    update();
    var response = ParkingService().addParking(
      name,
      description,
      address,
      phone,
      total_capacity,
      latitude,
      longitude,
      cost,
      working_hours,
      working_days,
      picture,
      owner_id,
    );
    response.then(
      (value) {
        getAllParking();
        addParkingLoading.value = false;
        update();
      },
    );
  }

  Future updateIsVerifyParking(guid, value) async {
    updateIsVerify.value = true;
    var response = ParkingService().updateIsVerified(guid, value);
    response.then(
      (value) {
        getAllParking();
        updateIsVerify.value = false;
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
