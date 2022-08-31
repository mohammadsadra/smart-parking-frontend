import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Models/parking.dart';

class ParkingWidget extends StatelessWidget {
  Parking parking;
  ParkingWidget({required this.parking});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  parking.address!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.star,
                //       color: Colors.yellow,
                //       size: 18,
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     // Text(
                //     //   parking.rating.toString(),
                //     //   style: const TextStyle(
                //     //     fontSize: 14,
                //     //     color: Colors.grey,
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
