import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:store/view/layout/home_layout.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../view_model/blocs/app_cubit/cubit.dart';
import '../home/home_screen.dart';

class SignIn extends StatefulWidget{
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  bool switchh = false;
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
              body:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Please enter your data to continue',
                              style: TextStyle(
                                color: Color(0xffb8F959E),
                                fontSize: 16,
                              ),)
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextFormField(
                        decoration:  const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                          label: Text('Username'),
                          labelStyle: TextStyle(
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbE7E8EA),
                                width: 1,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbE7E8EA),
                                width: 1,
                              )
                          ),
                          ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration:  const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                          label: Text('Password'),
                          labelStyle: TextStyle(
                            fontSize: 18,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbE7E8EA),
                                width: 1,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbE7E8EA),
                                width: 1,
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),

                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          onPressed: () {  },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffbEA4335)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 50,
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
                          )
                        ],
                      ),
                      const Spacer()
                    ],
                  )
              ),
              bottomNavigationBar: Container(
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
                        "Sign In",
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