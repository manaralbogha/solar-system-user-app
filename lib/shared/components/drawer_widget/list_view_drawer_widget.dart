import 'package:flutter/material.dart';

import 'package:solar_system/shared/const/const.dart';
import 'package:solar_system/shared/network/local/cache_helper.dart';

import 'list_tile_drawer_widget.dart';

class ListViewDrawerWidget extends StatelessWidget {
  const ListViewDrawerWidget(
      {super.key, required this.name, required this.emil});
  final String? name;
  final String? emil;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            name.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            emil.toString(),
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/download.png"),
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.5,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/shutterstock_581537176.0.jpg',
              ),
            ),
            // color: Colors.green,
          ),
        ),
        ListTileDrawerWidget(
          title: 'Home',
          icon: Icons.home_outlined,
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/HomeSolarSystemScreen', (route) => false);
          },
        ),
        ListTileDrawerWidget(
          title: 'Profile',
          icon: Icons.account_box,
          onTap: () {
            Navigator.popAndPushNamed(context, '/ProfileScreen');
          },
        ),
        // ListTileDrawerWidget(
        //   title: 'Products',
        //   icon: Icons.grid_3x3_outlined,
        //   onTap: () {},
        // ),
        // ListTileDrawerWidget(
        //   title: 'Contact',
        //   icon: Icons.contact_mail,
        //   onTap: () {},
        // ),
        ListTileDrawerWidget(
          title: 'Logout',
          icon: Icons.logout,
          onTap: () {
            CacheHelper.deletData(key: 'token');
            CacheHelper.deletData(key: 'name');
            CacheHelper.deletData(key: 'email');
            CacheHelper.deletData(key: 'phone');
            CacheHelper.deletData(key: 'dob');
            token = '';

            Navigator.pushNamedAndRemoveUntil(
                context, '/LoginScreen', (route) => false);
            print(CacheHelper.getData(key: 'token'));
            print(CacheHelper.getData(key: 'name'));
            print(CacheHelper.getData(key: 'email'));
            print(token);
          },
        ),
      ],
    );
  }
}
