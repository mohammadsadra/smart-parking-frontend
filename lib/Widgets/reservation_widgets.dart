import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Models/reservation.dart';
import 'package:smart_parking/Screens/parking_info_page.dart';

class ReservationCard extends StatelessWidget {
  Reservation reservation;
  ReservationCard({Key? key, required this.reservation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());
    Parking parking = parkingCtrl.allParking.firstWhere(
        (element) => element.id == reservation.parkingId,
        orElse: () => Parking());
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      QrImage(
                        data: reservation.guid!,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      Text(
                        'کد رزرو:\n${reservation.guid}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(
          children: [
            Stack(children: [
              Container(
                width: Get.width * 0.3,
                height: Get.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    image: NetworkImage(parking.picture!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.3,
                height: Get.width * 0.3,
                alignment: Alignment.center,
                child: const Text(
                  'مشاهده رزرو',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
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
                    height: 5,
                  ),
                  Text(
                    'زمان رزرو:\n شروع: ${reservation.startTime}\n پایان: ${reservation.endTime}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  // Text(
                  //   'مبلغ قابل پرداخت: ${reservation.cost} تومان',
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
