import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
