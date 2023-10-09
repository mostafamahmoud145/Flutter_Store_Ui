import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../view_model/blocs/app_cubit/cubit.dart';
import '../address/address_screen.dart';

class Cart extends StatefulWidget{
  const Cart({super.key});

  @override
  State<Cart> createState() => _Cart();
}

class _Cart extends State<Cart> {
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
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => cartItem(),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Info',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                color: Color(0xffb8f959e),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$110',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                                //color: Color(0xffb8f959e),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Shipping cost',
                              style: TextStyle(
                                color: Color(0xffb8f959e),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$10',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                                //color: Color(0xffb8f959e),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Color(0xffb8f959e),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$120',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                                //color: Color(0xffb8f959e),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 60,
              color: Color(0xffb9775FA),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Address())
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget cartItem () => Material(
  color: Colors.white,
  elevation: 5,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffbDEDEDE), Color(0xffbF5F6FA),]
      ),
    ),
    height: 130,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('lib/core/resources/assets/images/Cart_Item1.png', height: 110,),
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
                style: TextStyle(
                    color: Color(0xffb8F959E)
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
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
                            onPressed: () { },
                          ),
                        ),
                      ]
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("1"),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                      alignment: Alignment.center,
                      children: [
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
                            onPressed: () { },
                          ),
                        ),
                      ]
                  ),
                  const Spacer(),
                  Stack(
                      alignment: Alignment.center,
                      children: [
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

                      ]
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  ),
);