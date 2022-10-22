import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:smart_parking/Widgets/custom_material_color.dart' as clr;

class AddParkingPage extends StatefulWidget {
  @override
  State<AddParkingPage> createState() => _AddParkingPageState();
}

class _AddParkingPageState extends State<AddParkingPage> {
  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());
    var userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('افزودن پارکینگ'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'نام پارکینگ',
                      prefixIcon: const Icon(Icons.car_rental),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.name.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'توضیحات',
                      prefixIcon: const Icon(Icons.info),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.description.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'آدرس',
                      prefixIcon: const Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.address.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'تلفن',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.phone.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'ظرفیت کل',
                      prefixIcon: const Icon(Icons.safety_divider),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.total_capacity.value = int.parse(value);
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'عرض جغرافیایی',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.latitude.value = double.parse(value);
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'طول جغرافیایی',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.longitude.value = double.parse(value);
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'هزینه / ساعت',
                      prefixIcon: const Icon(Icons.money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.cost.value = double.parse(value);
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'ساعت کاری',
                      prefixIcon: const Icon(Icons.lock_clock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.working_hours.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'روزهای‌کاری',
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.working_days.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      labelText: 'لینک عکس',
                      prefixIcon: const Icon(Icons.link),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        parkingCtrl.picture.value = value;
                        parkingCtrl.update();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      print(parkingCtrl.name.value);
                      parkingCtrl.addParking(
                          parkingCtrl.name.value,
                          parkingCtrl.description.value,
                          parkingCtrl.address.value,
                          parkingCtrl.phone.value,
                          parkingCtrl.total_capacity.value,
                          parkingCtrl.latitude.value,
                          parkingCtrl.longitude.value,
                          parkingCtrl.cost.value,
                          parkingCtrl.working_hours.value,
                          parkingCtrl.working_days.value,
                          parkingCtrl.picture.value,
                          userCtrl.user.id);
                    },
                    child: Container(
                      width: Get.width,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: clr.CustomMaterialColor(133, 214, 224).mdColor,
                      ),
                      child: Obx(() {
                        if (parkingCtrl.addParkingLoading.value) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text(
                            'افزودن',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
