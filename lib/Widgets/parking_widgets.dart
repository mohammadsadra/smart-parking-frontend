import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Screens/parking_info_page.dart';

class ParkingWidget extends StatelessWidget {
  Parking parking;
  ParkingWidget({Key? key, required this.parking}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.to(ParkingInfoPage(
          parking: parking,
        ));
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
                    height: 5,
                  ),
                  Text(
                    parking.address!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'ظرفیت آزاد:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        parking.freeCapacity.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
