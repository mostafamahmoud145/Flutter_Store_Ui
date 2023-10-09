import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/home/home_screen.dart';
import 'package:store/view/layout/home_layout.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../view_model/blocs/app_cubit/cubit.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({super.key});

  @override
  State<OrderConfirmed> createState() => _OrderConfirmed();
}

class _OrderConfirmed extends State<OrderConfirmed> {
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Cart",
                style: TextStyle(color: Colors.black),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffbf5f6fa),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('lib/core/resources/assets/images/Order_Confirmed.png',height: 200,),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Order Confirmed!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Your order has been confirmed, we will send you confirmation email shortly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xffb8F959E), fontSize: 16),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeLayout())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xffbF5F5F5),
                        fixedSize: Size(double.infinity,5),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                    child: const Text(
                      'Go to orders',
                      style: TextStyle(
                        color: Color(0xffb8F959E),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: const Color(0xffb9775FA),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeLayout())
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue Shopping",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget cartItem() => Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffbDEDEDE),
                Color(0xffbF5F6FA),
              ]),
        ),
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/core/resources/assets/images/Cart_Item1.png',
                height: 110,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Men\'s Tie-Dye T-Shirt'),
                  SizedBox(
                    height: 2,
                  ),
                  const Text('Nike Sportswear'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '\$45 (-\$4.00 Tax)',
                    style: TextStyle(color: Color(0xffb8F959E)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffbDEDEDE), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Color(0xffb8F959E),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ]),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("1"),
                      const SizedBox(
                        width: 5,
                      ),
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffbDEDEDE), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_up_sharp,
                              color: Color(0xffb8F959E),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ]),
                      const Spacer(),
                      Stack(alignment: Alignment.center, children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xffbDEDEDE), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Color(0xffb8F959E),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
