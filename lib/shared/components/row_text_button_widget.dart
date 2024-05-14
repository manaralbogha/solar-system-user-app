import 'package:flutter/material.dart';

class BulidRow extends StatelessWidget {
  const BulidRow(
      {super.key,
      required this.formKey,
      required this.text,
      required this.buttonText,
      required this.onPressed});

  final GlobalKey<FormState> formKey;
  final String? text;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text!),
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(100, 40)),
            overlayColor: MaterialStateProperty.all(Colors.grey),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
