import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/order_confirmed/order_confirmed_screen.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';
import '../../view_model/blocs/app_cubit/cubit.dart';

class Address extends StatefulWidget{
  const Address({super.key});

  @override
  State<Address> createState() => _Address();
}

class _Address extends State<Address> {

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
                  "Address",
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
                child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(
                                color: Color(0xffb8F959E)
                            ),
                            hintText: "Mostafa Mahmoud",
                            fillColor: const Color(0xffbf5f6fa),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Country',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Color(0xffb8F959E)
                                      ),
                                      hintText: "Egypt",
                                      fillColor: const Color(0xffbf5f6fa),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'City',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Color(0xffb8F959E)
                                      ),
                                      hintText: "Suez",
                                      fillColor: const Color(0xffbf5f6fa),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(
                                color: Color(0xffb8F959E)
                            ),
                            hintText: "01021318712",
                            fillColor: const Color(0xffbf5f6fa),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        const Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(
                                color: Color(0xffb8F959E)
                            ),
                            hintText: "Suez _ Nile Street _ borg Al-Amir",
                            fillColor: const Color(0xffbf5f6fa),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
              bottomNavigationBar: Container(
                height: 60,
                color: Color(0xffb9775FA),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OrderConfirmed())
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Save Address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}