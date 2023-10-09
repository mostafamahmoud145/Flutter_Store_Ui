import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/brand_model.dart';
import '../../model/item_model.dart';
import '../../view_model/blocs/app_cubit/cubit.dart';
import '../../view_model/blocs/app_cubit/states.dart';
import '../item_details/item_details_screen.dart';

class BranItems extends StatefulWidget {
  const BranItems({super.key, required this.brand});
  final Brand brand;

  @override
  State<BranItems> createState() => _BranItems(brand: brand);
}

class _BranItems extends State<BranItems> {

  _BranItems({required this.brand});
  final Brand brand;

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
              title: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xffbF5F6FA)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(brand.image),
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "365 Items",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Available in stock',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffb8F959E),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Color(0xffbF5F6FA),
                            onPressed: () {},
                            elevation: 0,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sort,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Sort',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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

Widget brand(Brand model) => Container(
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