import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Models/parking.dart';

class ParkingMap extends StatelessWidget {
  var parkings;

  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());
    print(parkingCtrl.list);
    var count = parkingCtrl.list.where((c) => c == 1).length.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('نقشه پارکینگ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: parkingCtrl.column.value,
          children: List.generate(
            parkingCtrl.column.value * parkingCtrl.row.value,
            (index) {
              var ii = count.value;
              if (parkingCtrl.list[index] == 1) {
                count.value = ii - 1;
              }

              var cl = Colors.green.obs;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: parkingCtrl.list[index] == 1
                      ? cl.value
                      : Colors.transparent,
                  margin: const EdgeInsets.all(2),
                  child: Center(
                    child: Text(
                      parkingCtrl.list[index] == 1 ? 'P${ii}' : '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
