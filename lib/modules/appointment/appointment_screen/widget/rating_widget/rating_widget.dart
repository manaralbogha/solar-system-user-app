import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({
    super.key,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppointmentCubit.get(context);
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      cubit.rat = index + 1;
                    });
                  },
                  child: Icon(
                    index < cubit.rat ? Icons.star : Icons.star_border,
                    color: Colors.yellow[700],
                    size: 40,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
