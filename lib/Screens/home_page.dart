import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/Controllers/home_controller.dart';
import 'package:smart_parking/Screens/search_page.dart';
import 'package:smart_parking/Screens/user_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    return Scaffold(body: Obx(
      () {
        if (homeController.pageIndex.value == 0) {
          return const SearchPage();
        } else if (homeController.pageIndex.value == 1) {
          return const UserPage();
        }
        return const SearchPage();
      },
    ), bottomNavigationBar: Obx(() {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        onTap: homeController.changePageIndex,
        currentIndex: homeController.pageIndex.value,
      );
    }));
  }
}
