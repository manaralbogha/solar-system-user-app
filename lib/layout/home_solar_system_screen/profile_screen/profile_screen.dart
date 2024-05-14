import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:solar_system/layout/home_solar_system_screen/cubit/cubit.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/states.dart';
import 'package:solar_system/layout/home_solar_system_screen/profile_screen/widget/dialog_change_password.dart';

import '../../../shared/components/drawer_widget/list_tile_drawer_widget.dart';

import '../../../shared/network/local/cache_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return SafeArea(
          child: Scaffold(
            body: ConditionalBuilder(
              condition: true,
              builder: ((context) {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/shutterstock_581537176.0.jpg',
                      ),
                    ),
                    //  color: Colors.lightGreen.shade500,
                  ),
                  child: ListView(
                    children: [
                      ClipPath(
                        clipper:
                            OvalBottomBorderClipper(), //OvalBottomBorderClipper(),
                        child: Container(
                          height: 150,
                          color: Colors.blue.shade50,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      ListTileDrawerWidget(
                        title: CacheHelper.getData(key: 'name'),
                        icon: Icons.person,
                      ),
                      ListTileDrawerWidget(
                        title: CacheHelper.getData(key: 'email'),
                        icon: Icons.email,
                      ),
                      ListTileDrawerWidget(
                        title: CacheHelper.getData(key: 'phone'),
                        icon: Icons.phone,
                      ),
                      ListTileDrawerWidget(
                        title: CacheHelper.getData(key: 'dob'),
                        icon: Icons.date_range,
                      ),

                      // ListTileDrawerWidget(
                      //   title: 'name',
                      //   icon: Icons.person,
                      // ),
                      const DialogChangePassword(),
                      // ClipPath(
                      //   clipper:
                      //       OvalTopBorderClipper(), //OvalBottomBorderClipper(),
                      //   child: Container(
                      //     height: 200,
                      //     color: Color.fromARGB(114, 80, 186, 85),
                      //   ),
                      // ),
                    ],
                  ),
                );
              }),
              fallback: ((context) {
                return const Center(child: CircularProgressIndicator());
              }),
            ),
          ),
        );
      },
    );
  }
}
