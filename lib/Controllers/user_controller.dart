import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Models/user.dart';
import 'package:smart_parking/Screens/login_page.dart';
import 'package:smart_parking/Screens/login_signedin_page.dart';
import 'package:smart_parking/Services/account_service.dart';
import 'package:smart_parking/Services/parking_services.dart';
import 'package:smart_parking/Services/user_services.dart';

class UserController extends GetxController {
  RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  RxBool isPasswordVisible = true.obs;

  RxString email = ''.obs;
  RxString password = ''.obs;
  var user;

  var page;

  setUserInStorage() {
    GetStorage().write('user', user);
  }

  getUserFromStorage() {
    var temp = GetStorage().read('user');
    if (temp != null) {
      if (temp is User) {
        user = temp;
        return temp;
      }
      user = User.fromJson(temp);
      return user;
    }
    return null;
  }

  logout() {
    GetStorage().erase();
    page = LoginPage();
    update();
  }

  Future loginRegister() async {
    try {
      update();
      var res = await UserService().loginRegister(email.value, password.value);
      user = User.fromJson(res['user']);
      setUserInStorage();
      if (res['login'] == true ||
          (res['register'] == true && res['login'] == true)) {
        Get.snackbar('خوش‌آمدید!', 'شما با موفقیت وارد شدید.');
        page = UserSignedInPage();
        update();
      } else {
        Get.snackbar('ناموفق!', 'رمز عبور شما اشتباه است.');
      }
      return res;
    } catch (e) {
      Get.snackbar('Failed!', 'Something went wrong');
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserFromStorage();
    if (user != null) {
      page = UserSignedInPage();
    } else {
      page = LoginPage();
    }
  }
}
