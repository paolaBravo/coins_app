import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarErrorWidget extends StatelessWidget {
  final String textError;

  const SnackbarErrorWidget({Key? key, required this.textError})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: Get.height * 0.13,
      decoration: BoxDecoration(
        color: Theme.of(context).errorColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Error: " + textError,
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
