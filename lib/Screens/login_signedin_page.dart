import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Screens/add_reservation_page.dart';
import 'package:smart_parking/Widgets/reservation_widgets.dart';

class UserSignedInPage extends StatelessWidget {
  const UserSignedInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userCtrl) {
        return SafeArea(
          child: Scaffold(
            body: !userCtrl.isReservationLoading
                ? SingleChildScrollView(
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            (userCtrl.user != null
                                ? userCtrl.user.name
                                : userCtrl.user.email),
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.to(const AddReservationPage());
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.bookmark_border),
                                SizedBox(width: 8),
                                Text(
                                  'رزرو پارکینگ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.bookmark),
                              SizedBox(width: 8),
                              Text(
                                'رزرو های من',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          userCtrl.resList.length > 0
                              ? Column(
                                  children: userCtrl.resList
                                      .map((element) =>
                                          ReservationCard(reservation: element))
                                      .toList(),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    SizedBox(width: 30),
                                    Text(
                                      'شما رزروی ندارید',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              userCtrl.logout();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.logout),
                                SizedBox(width: 8),
                                Text(
                                  'خروج',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
