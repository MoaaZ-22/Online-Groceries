// ignore_for_file: avoid_print, use_full_hex_values_for_flutter_colors

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

  int activeIndex = 0;

  int detailsActiveIndex = 0;

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

  List<Widget> sliderWidget =
  [
    Image.network(
        fit: BoxFit.cover,
        'https://img.freepik.com/free-photo/concept-healthy-eating-top-view_23-2148502279.jpg?w=826&t=st=1666376143~exp=1666376743~hmac=a6907350be00de653beabfc7d85508ee4f728c13f5bb08499227615219851ebf'),
    Image.network(
        fit: BoxFit.cover,
        'https://img.freepik.com/free-photo/concept-healthy-eating-top-view_23-2148502279.jpg?w=826&t=st=1666376143~exp=1666376743~hmac=a6907350be00de653beabfc7d85508ee4f728c13f5bb08499227615219851ebf'),
    Image.network(
        fit: BoxFit.fill,
        'https://img.freepik.com/free-photo/concept-healthy-eating-top-view_23-2148502279.jpg?w=826&t=st=1666376143~exp=1666376743~hmac=a6907350be00de653beabfc7d85508ee4f728c13f5bb08499227615219851ebf'),
  ];

  List<Widget> detailsWidget =
  [
    Image.asset('assets/images/bananas.png'),
    Image.asset('assets/images/beef.png'),
    Image.asset('assets/images/pepper red.png'),
  ];

  void changeSmoothPage(int index)
  {
    activeIndex = index;
    emit(SmoothPageIndex());
  }

  List colors =
      [
        const Color(0xff26f8a44c),
        const Color(0xff2653B175),
        const Color(0xff40F7A593),
        const Color(0xff40D3B0E0),
        const Color(0xff40FDE598),
      ];

  void changeDetailsSmoothPage(int index)
  {
    activeIndex = index;
    emit(SmoothDetailsPageIndex());
  }

  void changeFavorites(bool isFavorites)
  {
    isFavorites = !isFavorites;
    emit(ChangeItemFavorites());
  }
}
