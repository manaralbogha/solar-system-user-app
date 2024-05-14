import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/cubit.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/states.dart';

import '../../modules/order/devices_screen/cubit/cubit.dart';
import '../../modules/order/devices_screen/cubit/states.dart';
import '../../shared/components/drawer_widget/list_view_drawer_widget.dart';
import '../../shared/network/local/cache_helper.dart';

class HomeSolarSystemScreen extends StatelessWidget {
  const HomeSolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    // final arg =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    // if (arg != null) {
    //   cubit.page = arg['page'];
    // }

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //  cubit.showCustomerByToken(token: token);
        return BlocConsumer<DevicesCubit, DevicesStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var devicesCubit = DevicesCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: CurvedNavigationBar(
                key: cubit.bottomNavigationKey,
                items: cubit.items,
                index: 0,
                height: 50.0,
                color: Colors.blue,
                buttonBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 500),
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
              appBar: AppBar(
                //toolbarHeight: 800,
                title: Center(
                  child: Text(
                    cubit.page == 0
                        ? 'Solar System'
                        : cubit.page == 1
                            ? 'Companies'
                            : 'Appointments',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // shape: const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.vertical(
                //     bottom: Radius.circular(15),
                //   ),
                // ),
                actions: const [
                  SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.light_mode_outlined,
                    ),
                  ),
                ],
              ),
              drawer: Drawer(
                //  backgroundColor: Colors.white,

                child: ListViewDrawerWidget(
                    name: CacheHelper.getData(key: 'name'),
                    emil: CacheHelper.getData(key: 'email')),
              ),
              body: cubit.screens[cubit.page],
              floatingActionButton: cubit.page != 2
                  ? FloatingActionButton.extended(
                      onPressed: () {
                        devicesCubit.totalWatt = 0;
                        devicesCubit.totalWattOnPower = 0;
                        devicesCubit.totalInverterWatt = 0;
                        devicesCubit.deviceCheck = [];

                        Navigator.pushNamed(context, '/DevicesScreen');
                      },
                      // tooltip: 'Increment',
                      heroTag: 'uniqueTag',
                      label: Row(
                        children: const [
                          Icon(Icons.add),
                          Text('Create Order'),
                        ],
                      ),
                    )
                  : const SizedBox(),
            );
          },
        );
      },
    );
  }
}
