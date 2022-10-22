import 'package:flutter/material.dart';
import 'package:smart_parking/Models/parking.dart';

class AddParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
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
                      // userCtrl.email.value = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      labelText: 'لینک عکس',
                      prefixIcon: const Icon(Icons.link),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      // userCtrl.email.value = value;
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
