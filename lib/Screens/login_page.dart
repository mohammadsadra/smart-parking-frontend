import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Widgets/custom_material_color.dart' as clr;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (userCtrl) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'به i-Park خوش‌آمدید',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(133, 214, 224, 1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'ایمیل',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        userCtrl.email.value = value;
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: userCtrl.isPasswordVisible.value,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            userCtrl.isPasswordVisible.value == false
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            userCtrl.isPasswordVisible.value =
                                !userCtrl.isPasswordVisible.value;
                            userCtrl.update();
                          },
                        ),
                      ),
                      onChanged: (value) {
                        userCtrl.password.value = value;
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        child: !userCtrl.isLoading
                            ? const Text(
                                'ثبت‌نام / ورود',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 100,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: clr.CustomMaterialColor(133, 214, 224).mdColor,
                        ),
                        margin: const EdgeInsets.only(top: 50),
                      ),
                      onTap: () {
                        userCtrl.loginRegister();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
