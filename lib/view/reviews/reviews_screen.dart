import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/add_review/add_review_screen.dart';
import 'package:store/view_model/blocs/app_cubit/cubit.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../item_details/item_details_screen.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _Reviews();
}

class _Reviews extends State<Reviews> {
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
                  "Reviews",
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
                padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '245 Reviews',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '4.8',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 66,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => rating(
                                          index, AppCubit.get(context).rate),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 0,
                                      ),
                                      itemCount: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          MaterialButton(
                            height: 25,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Color(0xffbFF7043),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AddReview())
                              );
                            },
                            child: Container(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.rate_review_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Add Review',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          //physics: BouncingScrollPhysics(),
                          //scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => review(),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          itemCount: 7,
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

Widget review() => Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/core/resources/assets/images/ME.jpg',
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mostafa Mahmoud",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.timer,
                      color: Color(0xffb8f959e),
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "6 Sep, 2023",
                      style: TextStyle(
                        color: Color(0xffb8f959e),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: const Row(
                        children: [
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'rating',
                            style: TextStyle(
                              color: Color(0xffb8f959e),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 66,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            rating(index, AppCubit.get(context).rate),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 0,
                        ),
                        itemCount: 5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet',
          style: TextStyle(
            color: Color(0xffb8f959e),
          ),
        ),
      ],
    );
