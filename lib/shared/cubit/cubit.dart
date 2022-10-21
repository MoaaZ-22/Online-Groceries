// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/modules/Account_Screen/account_screen.dart';
import 'package:online_groceries_app/modules/Cart_Screen/cart_screen.dart';
import 'package:online_groceries_app/modules/Explore_Screen/explore_screen.dart';
import 'package:online_groceries_app/modules/Favourites_Screen/favourites_screen.dart';
import 'package:online_groceries_app/modules/Shop_Screen/shop_screen.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int? bottomNavigationBarCurrentIndex = 0;

  //List For Bottom Navigation Bar
  List<BottomNavigationBarItem> bottomNavListItem =
  [
    const BottomNavigationBarItem(icon: Icon(IconlyBroken.shop), label: 'Shop'),
    const BottomNavigationBarItem(icon: Icon(IconlyBroken.search,), label: 'Explore'),
    const BottomNavigationBarItem(icon: Icon(IconlyBroken.buy), label: 'Cart'),
    const BottomNavigationBarItem(icon: Icon(IconlyBroken.heart), label: 'Favourites'),
    const BottomNavigationBarItem(icon: Icon(IconlyBroken.profile), label: 'Account'),
  ];

  List<Widget> homeLayoutScreens =
  [
    const ShopScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavouritesScreen(),
    const AccountScreen()
  ];


  void changeBottomNavIndex(int index)
  {
    bottomNavigationBarCurrentIndex = index;
    emit(NavBarChangeIndex());
  }
}
