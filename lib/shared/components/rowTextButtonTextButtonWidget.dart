import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/cubit.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';

class RowTextButtonTextButton extends StatelessWidget {
  final String name;
  final String countNum;
  final Function() onPressedAdd;
  final Function() onPressedRemove;

  const RowTextButtonTextButton({
    super.key,
    required this.name,
    required this.onPressedAdd,
    required this.onPressedRemove,
    required this.countNum,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo.shade300),
            ),
            IconButton(
                onPressed: onPressedRemove, icon: const Icon(Icons.remove)),
            Text(countNum),
            IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
          ],
        );
      },
    );
  }
}
