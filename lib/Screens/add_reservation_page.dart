import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:smart_parking/Controllers/parking_controller.dart';
import 'package:smart_parking/Controllers/user_controller.dart';
import 'package:smart_parking/Models/parking.dart';
import 'package:intl/intl.dart' as intl;

class AddReservationPage extends StatelessWidget {
  const AddReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parkingCtrl = Get.put(ParkingController());

    return GetBuilder<UserController>(
        init: UserController(),
        builder: (userCtrl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('رزرو پارکینگ'),
              foregroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'نام پارکینگ:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        DropdownButton(
                          value: userCtrl.selectedParking.value.toString(),
                          items: parkingCtrl.allParking.map((Parking parking) {
                            return DropdownMenuItem(
                              value: parking.id.toString(),
                              child: Text(parking.name!),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            userCtrl.selectedParking.value = int.parse(value!);
                            userCtrl.update();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          pickDateRange(context);
                        },
                        child: Text(
                          'شروع:  ' +
                              intl.DateFormat('dd-MM-yyyy – kk:mm')
                                  .format(userCtrl.startDate.value) +
                              '\nپایان:  ' +
                              intl.DateFormat('dd-MM-yyyy – kk:mm')
                                  .format(userCtrl.endDate.value),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          showPicker(
                            value: userCtrl.startTime.value,
                            onChange: (value) {
                              userCtrl.startTime.value = value;
                              userCtrl.update();
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'ساعت شروع:  ' +
                              userCtrl.startTime.value.hour.toString() +
                              ':' +
                              userCtrl.startTime.value.minute.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          showPicker(
                            value: userCtrl.endTime.value,
                            onChange: (value) {
                              userCtrl.endTime.value = value;
                              userCtrl.update();
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'ساعت پایان:  ' +
                              userCtrl.endTime.value.hour.toString() +
                              ':' +
                              userCtrl.endTime.value.minute.toString(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        userCtrl.addReservation(
                          parkingCtrl.allParking
                              .where((p0) =>
                                  p0.id == userCtrl.selectedParking.value)
                              .toList()[0]
                              .cost!,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(133, 214, 224, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'رزرو',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future pickDateRange(context) async {
    var userCtrl = Get.put(UserController());
    showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: userCtrl.startDate.value,
        end: userCtrl.endDate.value,
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 2),
      ),
    ).then((value) {
      if (value != null) {
        userCtrl.startDate.value = value.start;
        userCtrl.endDate.value = value.end;
        userCtrl.update();
      }
    });
  }
}
