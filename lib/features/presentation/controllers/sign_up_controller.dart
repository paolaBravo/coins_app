import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString signUpError = RxString("");
  var hiddenPassword = true.obs;

  void isHidden() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  Future<void> register() async {
    try {
      (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Get.offAllNamed("/navigation");
    } on FirebaseAuthException catch (e) {
      signUpError.value = e.message!;
    }
  }
}
