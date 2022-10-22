import 'dart:math';

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
      print(loaded[0].id);

      return loaded;
    } on DioError catch (e) {
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
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
    try {
      var response = await AccountService().dio.post('/parking/add', data: {
        'name': name,
        'description': description,
        'address': address,
        'city': 'Tehran',
        'phone': phone,
        'cost': cost,
        'total_capacity': total_capacity,
        'latitude': latitude,
        'longitude': longitude,
        'working_hours': working_hours,
        'working_days': working_days,
        'picture': picture,
        'owner_id': owner_id
      });
      print(response);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
  }
}
