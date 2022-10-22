import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Screens/add_reservation_page.dart';
import 'package:smart_parking/Widgets/reservation_widgets.dart';
import 'package:smart_parking/Widgets/validate_parking.dart';

class OwnerPage extends StatelessWidget {
  const OwnerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userCtrl) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(243, 246, 250, 1),
              shadowColor: Colors.transparent,
              centerTitle: false,
              title: Text(
                (userCtrl.user != null
                    ? userCtrl.user.name
                    : userCtrl.user.email),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      userCtrl.logout();
                    },
                    child: const Icon(Icons.logout),
                  ),
                ),
              ],
            ),
            body: !userCtrl.isReservationLoading
                ? Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(width: 15),
                          Text(
                            'پارکینگ‌های تایید نشده',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: parkingCtrl.notVerifiedParking.length,
                          itemBuilder: (context, i) {
                            return ValidateParkingWidget(
                                parking: parkingCtrl.notVerifiedParking[i]);
                          },
                        ),
                      ),
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
