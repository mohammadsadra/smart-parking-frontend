import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/home_controller.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Widgets/parking_widgets.dart';

class SearchPage extends StatelessWidget {
  var homeCtrl = Get.put(HomeController());
  var parkingCtrl = Get.put(ParkingController());
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: _controller,
          maxLines: 1,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: GestureDetector(
              onTap: () {
                _controller.clear();
                parkingCtrl.search.value = '';
                parkingCtrl.update();
              },
              child: const Icon(
                Icons.cancel_outlined,
              ),
            ),
            hintText: 'پارکینگی که می‌خواهی را پیدا کن!',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            parkingCtrl.search.value = value;
            parkingCtrl.update();
          },
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
                  itemCount: parkingCtrl.allParking.where((p) {
                    if (p.name!.contains(parkingCtrl.search.value) ||
                        p.address!.contains(parkingCtrl.search.value)) {
                      return true;
                    } else {
                      return false;
                    }
                  }).length,
                  itemBuilder: (context, i) {
                    return ParkingWidget(
                        parking: parkingCtrl.allParking.where((p) {
                      if (p.name!.contains(parkingCtrl.search.value) ||
                          p.address!.contains(parkingCtrl.search.value)) {
                        return true;
                      } else {
                        return false;
                      }
                    }).toList()[i]);
                  },
                );
        },
      ),
    );
  }
}
