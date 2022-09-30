import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;

  const ButtonWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onTap();
              },
              child: Text(text),
            ),
          )
        ],
      ),
    );
  }
}
