import 'package:coins_app/features/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Theme.of(context).backgroundColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: const AssetImage("assets/logo.png"),
                width: Get.width * 0.6),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Text(
              "Create a free account!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ButtonWidget(
                text: "Create an account", onTap: () => Get.toNamed("/signUp")),
            ButtonWidget(text: "Login", onTap: () => Get.toNamed("/login")),
          ],
        ),
      ),
    );
  }
}
