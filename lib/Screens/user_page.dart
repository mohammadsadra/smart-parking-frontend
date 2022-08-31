import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Screens/login_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userCtrl) {
        return userCtrl.page;
      },
    );
  }
}
