import 'package:coins_app/dependency_injection/injector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:coins_app/core/utility/theme.dart';
import 'package:get/get.dart';
import 'package:coins_app/core/utility/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injector.setup();
  String initialPage() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      return "/navigation";
    } else {
      return "/home";
    }
  }

  runApp(
    GetMaterialApp(
      title: 'Coins app',
      theme: Themes().theme,
      debugShowCheckedModeBanner: false,
      getPages: Router.routes,
      initialRoute: initialPage(),
    ),
  );
}
