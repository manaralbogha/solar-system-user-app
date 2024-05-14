import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/order/devices_screen/cubit/states.dart';
import 'package:solar_system/modules/order/suggested_companies_screen/suggested_gridview_company_widget/suggested_gridview_company_widget.dart';

import '../devices_screen/cubit/cubit.dart';

class SuggestedCompaniesScreen extends StatelessWidget {
  const SuggestedCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DevicesCubit, DevicesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: state is! CalculateBatteryNumberLoadingState,
            builder: (context) {
              var cubit = DevicesCubit.get(context);
              if (state is CalculateBatteryNumberSuccessState ||
                  cubit.suggestedSolarSystemModel != []) {
                return SuggestedGridViewCompanyWidget(
                  suggestedSolarSystemModel: cubit.suggestedSolarSystemModel,
                );
              }
              return const Center(child: Text('No Data'));
            },
            fallback: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
