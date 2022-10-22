import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Models/reservation.dart';
import 'package:smart_parking/Models/user.dart';
import 'package:smart_parking/Screens/admin_page.dart';
import 'package:smart_parking/Screens/login_page.dart';
import 'package:smart_parking/Screens/login_signedin_page.dart';
import 'package:smart_parking/Screens/owner_page.dart';
import 'package:smart_parking/Services/user_services.dart';

class UserController extends GetxController {
  RxBool _isLoading = false.obs;
  get isLoading => _isLoading.value;

  RxBool _isReservationLoading = false.obs;
  get isReservationLoading => _isReservationLoading.value;

  RxBool _addReserveLoading = false.obs;
  get addReserveLoading => _addReserveLoading.value;

  RxBool isPasswordVisible = true.obs;

  RxString email = ''.obs;
  RxString password = ''.obs;

  RxInt selectedParking = 1.obs;

  var startDate = DateTime.now().obs;
  var endDate = DateTime.now()
      .add(
        const Duration(hours: 1),
      )
      .obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay(
          hour: DateTime.now().add(Duration(hours: 1)).hour,
          minute: DateTime.now().add(Duration(hours: 1)).minute)
      .obs;

  RxList<Reservation> resList = <Reservation>[].obs;
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

  routingPage(User user) {
    if (user.role!.toLowerCase() == 'normal') {
      return UserSignedInPage();
    } else if (user.role!.toLowerCase() == 'admin') {
      return AdminPage();
    } else if (user.role!.toLowerCase() == 'owner') {
      return OwnerPage();
    }
  }

  Future loginRegister() async {
    try {
      _isLoading.value = true;
      update();
      var res = await UserService().loginRegister(email.value, password.value);
      user = User.fromJson(res['user']);
      setUserInStorage();
      if (res['login'] == true ||
          (res['register'] == true && res['login'] == true)) {
        Get.snackbar('خوش‌آمدید!', 'شما با موفقیت وارد شدید.');
        page = routingPage(user);
      } else {
        Get.snackbar('ناموفق!', 'رمز عبور شما اشتباه است.');
      }
      _isLoading.value = false;
      update();
      getUserReservations();
      return res;
    } catch (e) {
      Get.snackbar('Failed!', 'Something went wrong');
      return false;
    }
  }

  Future getUserReservations() async {
    try {
      _isReservationLoading.value = true;
      update();
      var res = await UserService().getUserReservations(user.id);
      resList.value = res;
      _isReservationLoading.value = false;
      update();
      return true;
    } catch (e) {
      print(e);
      Get.snackbar('Failed!', 'Something went wrong');
      return false;
    }
  }

  Future addReservation(cost) async {
    try {
      _addReserveLoading.value = true;
      update();
      Gregorian newStart = Gregorian(
        startDate.value.year,
        startDate.value.month,
        startDate.value.day,
        startTime.value.hour,
        startTime.value.minute,
      );
      final s = newStart.formatter;
      DateTime dateTimeStart = DateTime(
        startDate.value.year,
        startDate.value.month,
        startDate.value.day,
        startTime.value.hour,
        startTime.value.minute,
      );

      Gregorian newEnd = Gregorian(
        endDate.value.year,
        endDate.value.month,
        endDate.value.day,
        endTime.value.hour,
        endTime.value.minute,
      );
      final e = newEnd.formatter;
      DateTime dateTimeEnd = DateTime(
        endDate.value.year,
        endDate.value.month,
        endDate.value.day,
        endTime.value.hour,
        endTime.value.minute,
      );
      var res = await UserService().addReservation(
        user.id,
        selectedParking.value,
        '${s.yyyy}-${s.mm}-${s.dd} ' +
            (dateTimeStart.hour < 10
                ? '0${dateTimeStart.hour}:'
                : '${dateTimeStart.hour}:') +
            (dateTimeStart.minute < 10
                ? '0${dateTimeStart.minute}'
                : '${dateTimeStart.minute}') +
            ':00.0',
        '${e.yyyy}-${e.mm}-${e.dd} ' +
            (dateTimeEnd.hour < 10
                ? '0${dateTimeEnd.hour}:'
                : '${dateTimeEnd.hour}:') +
            (dateTimeEnd.minute < 10
                ? '0${dateTimeEnd.minute}'
                : '${dateTimeEnd.minute}') +
            ':00.0',
        cost * endDate.value.difference(startDate.value).inHours,
      );
      _addReserveLoading.value = false;
      // resList.add(res);
      Get.back();
      update();
      Get.snackbar('موفق!', 'رزرو با موفقیت انجام شد.');
      getUserReservations();
      return true;
    } catch (e) {
      print(e);
      Get.snackbar('Failed!', 'Something went wrong');
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserFromStorage();
    if (user != null) {
      page = routingPage(user);
      if (user.role == 'Normal') {
        getUserReservations();
      }
    } else {
      page = LoginPage();
    }
  }
}
