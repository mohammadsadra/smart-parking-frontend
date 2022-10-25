import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Screens/create_parking_map.dart';

class GetRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());
    return Scaffold(
        appBar: AppBar(
          title: Text('ساخت نقشه پارکینگ'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: const Text(
                  'تعداد ردیف و ستون‌ را وارد کنید.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ستون ها',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  parkingCtrl.column.value = int.parse(value);
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ردیف ها',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  parkingCtrl.row.value = int.parse(value);
                },
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Get.to(CreatingParkingMap());
                },
                child: const Text(
                  'تایید',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
