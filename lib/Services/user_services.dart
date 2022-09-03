import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_parking/Models/reservation.dart';
import 'package:smart_parking/Services/account_service.dart';

class UserService {
  Future getUsers() async {
    try {
      var response = await AccountService().dio.get('/user/getall');

      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
  }

  Future getUserReservations(id) async {
    try {
      var response = await AccountService()
          .dio
          .get('/reservation/getUserReservations/' + id.toString());
      List<Reservation> resList = [];
      for (var i = 0; i < response.data['all'].length; i++) {
        resList.add(
          Reservation.fromJson(response.data['all'][i]),
        );
      }
      print(resList);
      return resList;
    } on DioError catch (e) {
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
        print(e.response);
        return e.response;
      }
    }
  }

  Future addReservation(
    user_id,
    parking_id,
    start_time,
    end_time,
    cost,
  ) async {
    try {
      var response = await AccountService().dio.post('/reservation/add', data: {
        'user': user_id,
        'parking_id': parking_id,
        'start_time': start_time,
        'end_time': end_time,
        'cost': cost,
        'status': 'reserved'
      });

      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
  }

  Future<Map<String, dynamic>> loginRegister(email, password) async {
    try {
      var response = await AccountService().dio.post(
        '/user/loginregister',
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response);
      return response.data;
    } on DioError catch (e) {
      print(e.response);
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
      }
      return {'error': 'Something went wrong'};
    }
  }
}
