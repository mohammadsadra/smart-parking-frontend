import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Screens/parking_map.dart';

class CreatingParkingMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());

    var twoD = List.generate(
      parkingCtrl.column.value * parkingCtrl.row.value,
      (index) {
        return 0.obs;
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('اماکن پارک را انتخاب کنید'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print(twoD);
              parkingCtrl.list.value = twoD;
              Get.to(ParkingMap());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: parkingCtrl.column.value,
          children: List.generate(
            parkingCtrl.column.value * parkingCtrl.row.value,
            (index) {
              var cl = Colors.grey.obs;
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  cl.value =
                      cl.value == Colors.grey ? Colors.green : Colors.grey;
                  twoD[index] = cl.value == Colors.grey ? 0.obs : 1.obs;
                },
                child: Obx(
                  () => Container(
                    color: cl.value,
                    margin: EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        'P${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
