import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_parking/Services/account_service.dart';

class UserService {
  Future getUsers() async {
    try {
      var response = await AccountService().dio.get('/user/getall');
      print(response);

      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        Get.snackbar('Failed!', 'Something went wrong');
        return e.response;
      }
    }
  }
}
