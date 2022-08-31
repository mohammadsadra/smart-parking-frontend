import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/home_controller.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Widgets/parking_widgets.dart';

class SearchPage extends StatelessWidget {
  var homeCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: TextFormField(
          maxLines: 1,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'پارکینگی که می‌خواهی را پیدا کن!',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {},
        ),
      ),
      body: GetBuilder<ParkingController>(
        init: ParkingController(),
        builder: (parkingCtrl) {
          return parkingCtrl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: parkingCtrl.allParking.length,
                  itemBuilder: (context, i) {
                    return ParkingWidget(parking: parkingCtrl.allParking[i]);
                  },
                );
        },
      ),
    );
  }
}
