import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:location/location.dart';
import 'package:smart_parking/Controllers/home_controller.dart';
import 'package:smart_parking/Screens/home_page.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
  Get.put(HomeController()).initLocationService();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'i-Park',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Kalameh',
      ),
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
