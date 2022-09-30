import 'package:coins_app/features/presentation/controllers/sign_up_controller.dart';
import 'package:coins_app/features/presentation/widgets/button_widget.dart';
import 'package:coins_app/features/presentation/widgets/snackbar_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGN UP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Email"),
            SizedBox(height: Get.height * 0.005),
            TextField(
              style: Theme.of(context).textTheme.caption,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
            ),
            SizedBox(height: Get.height * 0.02),
            const Text("Password"),
            SizedBox(height: Get.height * 0.005),
            Obx(
              () => TextField(
                style: Theme.of(context).textTheme.caption,
                controller: controller.passwordController,
                obscureText: controller.hiddenPassword.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isHidden();
                    },
                    icon: controller.hiddenPassword.value
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            ButtonWidget(
                text: "Sign up",
                onTap: () async {
                  await controller.register();
                  if (controller.signUpError.value != "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: SnackbarErrorWidget(
                          textError: controller.signUpError.value,
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
