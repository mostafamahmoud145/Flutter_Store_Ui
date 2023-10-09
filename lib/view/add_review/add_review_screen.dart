import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../view_model/blocs/app_cubit/cubit.dart';

class AddReview extends StatefulWidget{
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReview();
}

class _AddReview extends State<AddReview> {

  double _value = 2.5;

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
                  "Add Review",
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
                        'How was your experience ?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Color(0xffb8F959E)
                          ),
                          hintText: "Describe your experience..",
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
                        'Rate',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        children: [
                          const Text('0.0'),
                          Expanded(
                            child: Slider(
                                divisions: 50,
                                label: _value.toStringAsFixed(1).toString(),
                                thumbColor: Color(0xffb9775FA),
                                inactiveColor: Color(0xffbF5F6FA),
                                activeColor: Color(0xffbF5F6FA),
                                secondaryActiveColor: Colors.red,
                                max: 5,
                                min: 0,
                                value: _value ,
                                onChanged: (value){
                                  setState(() {

                                  });
                                  _value = value;
                                }),
                          ),
                          const Text('5.0'),
                        ],
                      )
                    ],
                  )
              ),
            ),
            bottomNavigationBar: Container(
                height: 60,
                color: Color(0xffb9775FA),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Submit Review",
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