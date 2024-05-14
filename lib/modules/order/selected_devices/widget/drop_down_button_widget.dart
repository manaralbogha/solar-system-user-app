import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/const/const.dart';
import '../../devices_screen/cubit/cubit.dart';
import '../../devices_screen/cubit/states.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget(
      {super.key, required this.mainten, this.companyId});
  final bool mainten;
  final int? companyId;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = DevicesCubit.get(context);

        return DropdownButton(
          value: cubit.syrianProvince,
          items: cubit.syrianProvinces.map((provinces) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: provinces,
              child: Text(
                provinces,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              cubit.syrianProvince = val.toString();
              if (mounted == true) {
                cubit.getAvailableAppointments(
                  token: token.toString(),
                  companyId: widget.companyId!.toInt(),
                );
              }
            });
          },
          icon: const Icon(Icons.arrow_circle_down_sharp),
          iconEnabledColor: Colors.blue, //Icon color
          style: const TextStyle(
              //te
              color: Colors.blue, //Font color
              fontSize: 20 //font size on dropdown button
              ),
          //  dropdownColor: Colors.redAccent,
        );
      },
    );
  }
}
