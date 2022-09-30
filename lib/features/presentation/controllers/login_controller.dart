import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString loginError = RxString("");
  var hiddenPassword = true.obs;

  void isHidden() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  Future<void> logInWithEmailAndPassword() async {
    try {
      (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user!;
      Get.offAllNamed("/navigation");
    } on FirebaseAuthException catch (e) {
      loginError.value = e.message!;
    }
  }
}
