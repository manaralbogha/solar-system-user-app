import 'package:flutter/material.dart';

import '../../../../../shared/const/const.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.image, required this.count});
  final String image;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xff964B00),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(
                  endPointImage + image,
                  fit: BoxFit.cover,
                  // height: 100,
                ),
              ),
            ),
          ),
        ),
        Container(
          // height: 40,
          //width: 40,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.green.shade400,
            border: Border.all(color: const Color(0xff964B00), width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            count,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
