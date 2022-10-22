import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Screens/parking_info_page.dart';

class ValidateParkingWidget extends StatelessWidget {
  Parking parking;
  ValidateParkingWidget({Key? key, required this.parking}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(parking.picture!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parking.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    parking.is_verified! ? 'تایید شده' : 'در انتظار تایید',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  var parkingCtrl = Get.put(ParkingController());
  var userCtrl = Get.put(UserController());

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("تایید"),
      onPressed: () {
        Navigator.pop(context);
        parkingCtrl.updateIsVerifyParking(parking.guid, true).then((value) {
          userCtrl.update();
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('تایید ' + parking.name!),
      content: const Text('آیا اطلاعات پارکینگ ' + 'مورد تایید است؟'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
