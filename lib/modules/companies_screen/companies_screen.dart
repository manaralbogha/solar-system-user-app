import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/companies_screen/cubit/cubit.dart';
import 'package:solar_system/modules/companies_screen/widget/gridview_company_widget/gridview_company_widget.dart';

import '../../shared/const/const.dart';
import 'cubit/states.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = CompanyScreenCubit.get(context);
    cubit.getAllCompany(token: token.toString());
    return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
      listener: (context, state) {
        //  state is CompanyScreenSuccessState? state.allCompany.data.
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! CompanyScreenLoadingState,
          builder: (context) {
            if (state is CompanyScreenSuccessState ||
                cubit.allCompany != null) {
              return GridViewCompanyWidget(
                companies: cubit.allCompany!.data!.data,
              );
            }
            return const Center(child: Text('No00 Data'));
          },
          fallback: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
