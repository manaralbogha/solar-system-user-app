import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/layout/home_solar_system_screen/cubit/cubit.dart';
import 'package:solar_system/modules/companies_screen/cubit/cubit.dart';
import 'package:solar_system/modules/google_map/google_map.dart';
import 'package:solar_system/modules/order/selected_devices/selected_devices_screen.dart';
import 'package:solar_system/shared/network/local/cache_helper.dart';
import 'package:solar_system/shared/network/remote/dio_helper.dart';
import 'package:solar_system/modules/order/suggested_companies_screen/suggested_companies_screen.dart';
import 'layout/home_solar_system_screen/home_solar_system_screen.dart';
import 'layout/home_solar_system_screen/profile_screen/profile_screen.dart';
import 'modules/appointment/appointment_screen/cubit/cubit.dart';
import 'modules/appointment/view_the_appointment_orders_screen/view_the_appointment_orders_screen.dart';
import 'modules/order/devices_screen/cubit/cubit.dart';
import 'modules/order/devices_screen/devices_screen.dart';
import 'modules/order/edit_device_information_screen/edit_device_information_screen.dart';
import 'modules/login_Screen/login_screen.dart';
import 'modules/order/edit_suggested_product_screen/edit_suggested_product_screen.dart';
import 'modules/order/order_sceen/order_screen.dart';
import 'modules/order/suggested_details_solar_system_screen/suggested_details_solar_system_screen.dart';
import 'modules/order/suggested_product_for_company_screen/suggested_product_for_company_screen.dart';
import 'modules/order/suggested_solar_systems_for_one_company/suggested_solar_systems_for_one_company.dart';
import 'modules/register_screen/register_screen.dart';
import 'modules/show_product_for_company_screen/show_product_for_company_screen.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => DevicesCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CompanyScreenCubit(), //..getAllCompany(token: token.toString()),
        ),
        BlocProvider(
          create: (context) => AppointmentCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //secondaryHeaderColor: Colors.pink,
          brightness: Brightness.light,
          textTheme: const TextTheme(),
        ),
        initialRoute:
            CacheHelper.getData(key: 'token') == null ? '/LoginScreen' : '/',
        routes: {
          '/': (context) => const HomeSolarSystemScreen(),
          '/googleMap': (context) => const googleMap(),
          '/LoginScreen': (context) => const LoginScreen(),
          '/RegisterScreen': (context) => const RegisterScreen(),
          '/HomeSolarSystemScreen': (context) => const HomeSolarSystemScreen(),
          '/EditDeviceInformationScreen': (context) =>
              const EditDeviceInformationScreen(),
          '/DevicesScreen': (context) => const DevicesScreen(),
          '/SelectedDevicesScreen': (context) => const SelectedDevicesScreen(),
          '/ShowProductForCompanyScreen': (context) =>
              const ShowProductForCompanyScreen(),
          '/SuggestedCompaniesScreen': ((context) =>
              const SuggestedCompaniesScreen()),
          '/SuggestedProductForCompanyScreen': ((context) =>
              const SuggestedProductForCompanyScreen()),
          '/EditSuggestedProductScreen': (context) =>
              const EditSuggestedProductScreen(),
          '/OrderScreen': (context) => const OrderScreen(),
          '/ProfileScreen': (context) => const ProfileScreen(),
          "/ViewTheAppointmentOrders": ((context) =>
              const ViewTheAppointmentOrders()),
          '/SuggestedSolarSystemsForOneCompany': (context) =>
              const SuggestedSolarSystemsForOneCompany(),
          '/SuggestedDetailsSolarSystemScreen': (context) =>
              const SuggestedDetailsSolarSystemScreen(),
          //  'HomeScreen':(context) => HomeScreen(),
        },
        // builder: (context, child) {
        //   return MediaQuery(
        //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        //     child: child as Widget,
        //   );
        //     },
      ),
    );
  }
}
