import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:store/view/cart/cart_screen.dart';
import 'package:store/view/reviews/reviews_screen.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../view_model/blocs/app_cubit/cubit.dart';


class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _HomeScreen();
}

class _HomeScreen extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(initialState())
        ..getBrands()
        ..getItems(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xffbf5f6fa),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.arrow_left,
                                    color: Colors.black,)
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'lib/core/resources/assets/images/item1_det.png',
                              height: 330,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xffbf5f6fa),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_basket),
                                  color: Colors.black
                                ),
                              ),
                            ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Men's Printed Pullover Hoodie",
                                      style: TextStyle(
                                        color: Color(0xffb8f959e),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Nike Club Fleece",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        color: Color(0xffb8f959e),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$120",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 90,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    itemImages(index, context),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount:
                                    AppCubit.get(context).itemImages.length,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  "Size Guide",
                                  style: TextStyle(
                                    color: Color(0xffb8f959e),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 70,
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      itemSize(index, context),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 15,
                                      ),
                                  itemCount: AppCubit.get(context).size.length),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Description",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer()
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const ReadMoreText(
                              "The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with",
                              trimLines: 3,
                              trimCollapsedText: " Read More",
                              trimExpandedText: " Less",
                              trimMode: TrimMode.Line,
                              style: TextStyle(
                                color: Color(0xffb8f959e),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Reviews())
                                    );
                                  },
                                  child: const Text("View All",
                                      style: TextStyle(
                                        color: Color(0xffb8f959e),
                                      )
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage('lib/core/resources/assets/images/ME.jpg',),
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
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
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
                                              itemBuilder: (context, index) => rating(index, AppCubit.get(context).rate),
                                              separatorBuilder: (context, index) => const SizedBox(width: 0,),
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
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Color(0xffb8f959e),
                              ),),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Price",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "with VAT, SD",
                                      style: TextStyle(
                                        color: Color(0xffb8f959e),
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "\$125",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 60,
                color: const Color(0xffb9775FA),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cart())
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.shopping_cart, color: Colors.white,)
                    ],
                  ),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}

Widget itemImages(index, context) => ClipRRect(
      child: Image.asset(AppCubit.get(context).itemImages[index]),
      borderRadius: BorderRadius.circular(15),
    );

Widget itemSize(index, context) => Container(
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffbF5F6FA)),
      child: Center(
          child: Text(
        AppCubit.get(context).size[index],
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );

Widget rating(index, rate) {
  if(rate - index > 0)
    {
      return const Icon(Icons.star, color: Color(0xffbFF981F), size: 13);
    }
  else{
    return const Icon(Icons.star_outline, size: 13);
  }
}
