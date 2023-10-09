import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/brand_items/brand_items_screen.dart';
import 'package:store/view/item_details/item_details_screen.dart';

import '../../model/brand_model.dart';
import '../../model/item_model.dart';
import '../../view_model/blocs/app_cubit/cubit.dart';
import '../../view_model/blocs/app_cubit/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Welcome to Laza",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(CupertinoIcons.search),
                                filled: true,
                                hintText: "Search..",
                                hintStyle:
                                const TextStyle(color: Color(0xffb8F959E)),
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
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffb9775fa),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.search,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Choose Brand",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            "View All",
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
                        height: 55,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              brand(AppCubit.get(context).brands[index], context),
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                          itemCount: AppCubit.get(context).brands.length,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            "New Arrival",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Color(0xffb8f959e),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 0.58,
                          children: List.generate(
                              4,
                                  (index) =>
                                  items(AppCubit.get(context).items[index], context)))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget brand(Brand model, context) => GestureDetector(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => BranItems(brand: model),
    // Pass the arguments as part of the RouteSettings. The
    // DetailScreen reads the arguments from these settings.
    ),
    );
  },
  child:   Container(
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(10),

      color: const Color(0xffbf5f6fa),

    ),

    child: Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Padding(

          padding: const EdgeInsets.only(left: 8.0),

          child: Container(

            height: 40,

            width: 50,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10), color: Colors.white),

            child: Padding(

              padding: const EdgeInsets.all(8.0),

              child: Image.asset(model.image),

            ),

          ),

        ),

        const SizedBox(

          width: 10,

        ),

        Padding(

          padding: const EdgeInsets.only(right: 8.0),

          child: Text(

            model.name,

            style: const TextStyle(

              fontWeight: FontWeight.w500,

              fontSize: 17,

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget items(Item item, context) => GestureDetector(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ItemDetails())
    );
  },
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Expanded(

        child: Container(

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(15),

            color: const Color(0xffbf2f2f2),

          ),

          child: Stack(

            alignment: Alignment.topRight,

            children: [

              Image.asset(

                item.image,

                fit: BoxFit.contain,

              ),

              Padding(

                padding: const EdgeInsets.all(7.0),

                child: IconButton(

                    onPressed: () {},

                    icon: const Icon(

                      CupertinoIcons.heart,

                      color: Colors.grey,

                    )),

              )

            ],

          ),

        ),

      ),

      //Spacer(),

      Text(

        item.name,

        maxLines: 1,

        overflow: TextOverflow.ellipsis,

        style: const TextStyle(fontWeight: FontWeight.w400),

      ),

      Text(

        item.brand,

        maxLines: 1,

        overflow: TextOverflow.ellipsis,

        style: const TextStyle(fontWeight: FontWeight.w400),

      ),

      const SizedBox(

        height: 5,

      ),

      Text(

        item.price,

        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),

      )

    ],

  ),
);