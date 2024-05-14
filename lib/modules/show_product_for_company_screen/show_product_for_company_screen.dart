import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/modules/companies_screen/cubit/cubit.dart';
import 'package:solar_system/modules/companies_screen/cubit/states.dart';

import '../../models/model_get_all_company.dart';

import 'gridview_products_for_company_widget/gridview_products_for_company_widget.dart';

class ShowProductForCompanyScreen extends StatelessWidget {
  const ShowProductForCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final DataCompany company = arg['company'];
    return BlocConsumer<CompanyScreenCubit, CompanyScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CompanyScreenCubit.get(context);
        //cubit.getProductForCompany(token: token, id: company.id);
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text(company.name)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.sunny),
              )
            ],
          ),
          drawer: const Drawer(),
          body: ConditionalBuilder(
            condition: state is! GetProductForCompanyLoadingState,
            builder: (context) {
              return GridViewProductsForCompanyWidget(
                products: cubit.productForCompany!.data![0].products,
              );
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
