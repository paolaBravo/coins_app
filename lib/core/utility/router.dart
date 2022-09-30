import 'package:coins_app/features/presentation/pages/coins_page.dart';
import 'package:coins_app/features/presentation/pages/compare_page.dart';
import 'package:coins_app/features/presentation/pages/favorite_page.dart';
import 'package:coins_app/features/presentation/pages/home_page.dart';
import 'package:coins_app/features/presentation/pages/login_page.dart';
import 'package:coins_app/features/presentation/widgets/navigation_page.dart';
import 'package:coins_app/features/presentation/pages/sign_up_page.dart';
import 'package:get/get.dart';

class Router {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUpPage(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/navigation',
      page: () => NavigationPage(),
    ),
    GetPage(
      name: '/coins',
      page: () => CoinsPage(),
    ),
    GetPage(
      name: '/compare',
      page: () => ComparePage(),
    ),
    GetPage(
      name: '/favorite',
      page: () => FavoritePage(),
    ),
  ];
}
