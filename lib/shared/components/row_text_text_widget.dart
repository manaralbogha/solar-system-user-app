import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RowTextText extends StatelessWidget {
  // int index;
  final String name;
  final String number;
  Color color;
  double sized;
  double sized1;
  double size;
  RowTextText({
    super.key,
    //required this.index,
    required this.name,
    required this.number,
    this.sized = 85,
    this.sized1 = 150,
    this.color = Colors.black,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: sized1,
          child: AutoSizeText(
            name,
            style: TextStyle(
              fontSize: size,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
              color: Colors.indigo.shade300,
            ),
            minFontSize: 8,
            maxLines: 1,
            //overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
          ),
        ),
        // SizedBox(
        //   width: 5,
        // ),
        SizedBox(
          width: sized,
          child: AutoSizeText(
            number,
            style: TextStyle(fontSize: size, color: color),
            minFontSize: 8,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
