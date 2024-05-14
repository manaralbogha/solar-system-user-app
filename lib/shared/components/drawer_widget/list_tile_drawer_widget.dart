import 'package:flutter/material.dart';

class ListTileDrawerWidget extends StatelessWidget {
  const ListTileDrawerWidget(
      {super.key, required this.title, this.onTap, required this.icon});
  final String title;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.blue.shade50,
      ),
      child: ListTile(
        textColor: const Color(0xff964B00),
        iconColor: Colors.blue.shade700,
        leading: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.grey.shade300,
          ),
          child: Icon(
            icon,
            // color: Color(0xff964B00),
          ),
        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
