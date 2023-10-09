import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:store/model/item_model.dart';
import 'package:store/view_model/blocs/app_cubit/cubit.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../model/brand_model.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(initialState())
        ..getBrands()
        ..getItems(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(
            key: _key,
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppCubit.get(context).labels[AppCubit.get(context).currentIndex],
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15,),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffbf5f6fa),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                      });
                      _key.currentState!.openDrawer();
                    },
                    icon: Image.asset(
                      'lib/core/resources/assets/images/menu.png',
                    ),
                  ),
                ),
              ),
            ),
            body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket_rounded), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: 'Fav'),
              ],
              selectedItemColor: const Color(0xffb9775fa),
              unselectedItemColor: Colors.grey,

              onTap: (index) {
                AppCubit.get(context).changeIndex(index);

              },
              currentIndex: AppCubit.get(context).currentIndex,
            ),
            drawer: const NavigationDrawer(),
          );
        },
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigationDrawer();
}

class _NavigationDrawer extends State<NavigationDrawer> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool switchh = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 250,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).padding.bottom + 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffbf5f6fa),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                icon: Image.asset(
                  'lib/core/resources/assets/images/menu2.png',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                      'lib/core/resources/assets/images/ME.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Mostafa Mahmoud",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Image.asset(
                  'lib/core/resources/assets/images/light.png',
                  color: Colors.black,
                  height: 25,
                ),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
                trailing: SizedBox(
                  width: 52,
                  height: 28,
                  child: FlutterSwitch(
                    activeColor: Color(0xffb34C759),
                    activeToggleColor: Colors.white,
                    inactiveColor: Color(0xffbD6D6D6),
                    inactiveToggleColor: Colors.white,
                    value: switchh,
                    onToggle: (value) {
                      setState(() {});
                      switchh = value;
                    },
                  ),
                )),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/accountInfo.png',
                color: Colors.black,
                height: 25,
              ),
              title: const Text(
                'Account Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/password.png',
                color: Colors.black,
                height: 25,
              ),
              title: const Text(
                'Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/bag.png',
                height: 25,
                color: Colors.black,
              ),
              title: const Text(
                'Orders',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/wishlist.png',
                height: 25,
                color: Colors.black,
              ),
              title: const Text(
                'Wishlist',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/settings.png',
                height: 25,
                color: Colors.black,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              leading: Image.asset(
                'lib/core/resources/assets/images/logout.png',
                height: 25,
                color: const Color(0xffbFF5757),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                    color: Color(0xffbFF5757),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

