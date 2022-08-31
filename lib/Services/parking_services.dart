import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Services/account_service.dart';

class ParkingService {
  Future getAllParking() async {
    try {
      var response = await AccountService().dio.get('/parking/getall');
      List<Parking> loaded = [];
      for (int i = 0; i < response.data['allParking'].length; i++) {
        var res = Parking.fromJson(response.data['allParking'][i]);
        loaded.add(res);
      }

      return loaded;
    } on DioError catch (e) {
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
  }
}
