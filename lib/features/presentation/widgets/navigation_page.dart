import 'package:coins_app/features/presentation/controllers/navigation_controller.dart';
import 'package:coins_app/features/presentation/pages/coins_page.dart';
import 'package:coins_app/features/presentation/pages/compare_page.dart';
import 'package:coins_app/features/presentation/pages/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends GetView<NavigationController> {
  final NavigationController _controller = Get.put(NavigationController());

  NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _controller.currentIndex.value,
          children: [CoinsPage(), FavoritePage(), ComparePage()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _navigationItem("Coins", Icons.list),
            _navigationItem("Favorite", Icons.star),
            _navigationItem("Compare", Icons.compare_rounded),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: _controller.changePage,
        ),
      ),
    );
  }
}

BottomNavigationBarItem _navigationItem(String label, IconData icon) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
