import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/model/item_model.dart';
import 'package:store/view/cart/cart_screen.dart';
import 'package:store/view/wishlist/wishlist_screen.dart';
import 'package:store/view_model/blocs/app_cubit/states.dart';

import '../../../model/brand_model.dart';
import '../../../view/home/home_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);

  static AppCubit get(context) => BlocProvider.of(context);

  List<Brand> brands = [];
  List<Item> items = [];
  List itemImages = [
    "lib/core/resources/assets/images/item1_det4.png",
    "lib/core/resources/assets/images/item1_det3.png",
    "lib/core/resources/assets/images/item1_det2.png",
    "lib/core/resources/assets/images/item1_det1.png",
  ];
  List size = [
    "S",
    "M",
    "L",
    "XL",
    "2XL",
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const Cart(),
    const Wishlist(),
  ];

  List labels = [
    '',
    'Cart',
    'Wishlist',
  ];
  int rate = 4;

  void getBrands(){
    brands.add(Brand(name: 'Adidas', image: 'lib/core/resources/assets/images/adidas.png'));
    brands.add(Brand(name: "Nike", image: 'lib/core/resources/assets/images/nike.png'));
    brands.add(Brand(name: "Fila", image: 'lib/core/resources/assets/images/fila.png'));
    brands.add(Brand(name: "Puma", image: 'lib/core/resources/assets/images/puma.png'));
    emit(getBrandsSuccessState());
  }

  void getItems(){
    items.add(Item(name: 'Nike Sportswear Club', brand: 'Fleece', price: "99\$", image: 'lib/core/resources/assets/images/item1.png'));
    items.add(Item(name: 'Trail Running Jacket Nike', brand: 'Windrunner', price: "99\$", image: 'lib/core/resources/assets/images/item2.png'));
    items.add(Item(name: 'Training Top', brand: 'Nike Sport Clash', price: "99\$", image: 'lib/core/resources/assets/images/item3.png'));
    items.add(Item(name: 'Trail Running Jacket Nike', brand: 'Windrunner', price: "99\$", image: 'lib/core/resources/assets/images/item4.png'));
    emit(getItemsSuccessState());
  }

  int currentIndex = 0;
  void changeIndex(index){
    currentIndex = index;
    emit(changeIndexSuccessState());
  }
}