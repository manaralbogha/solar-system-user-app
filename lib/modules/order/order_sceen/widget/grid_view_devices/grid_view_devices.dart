import 'package:flutter/material.dart';

import '../../../../../models/model_devices_screen.dart';
import '../card_widget/card_widget.dart';

class GridViewDevicesWidget extends StatelessWidget {
  const GridViewDevicesWidget({super.key, required this.deviceCheck});
  final List<Data1> deviceCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        border: Border.all(color: Colors.green, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      height: 416,
      child: Column(
        children: [
          const Text(
            'DEVICES',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff964B00), //Colors.green.shade600,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                maxCrossAxisExtent: 300,
              ),
              itemCount: deviceCheck.length,
              itemBuilder: ((context, index) {
                // print(cubit.deviceCheck);
                return CardWidget(
                    image: deviceCheck[index].image,
                    count: deviceCheck[index].count.toString());
              }),
            ),
          ),
        ],
      ),
    );
  }
}
