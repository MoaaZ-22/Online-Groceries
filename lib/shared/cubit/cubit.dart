// ignore_for_file: avoid_print, use_full_hex_values_for_flutter_colors
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_groceries_app/models/User_Model/user_model.dart';
import 'package:online_groceries_app/modules/Account_Screen/account_screen.dart';
import 'package:online_groceries_app/modules/Cart_Screen/cart_screen.dart';
import 'package:online_groceries_app/modules/Explore_Screen/explore_screen.dart';
import 'package:online_groceries_app/modules/Favourites_Screen/favourites_screen.dart';
import 'package:online_groceries_app/modules/Shop_Screen/shop_screen.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/Product_Model/product_model.dart';
import '../components/consts.dart';

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
        'https://img.freepik.com/free-vector/religious-ramadan-kareem-islamic-festival-banner-design-vector_1055-12615.jpg?size=626&ext=jpg'),
    Image.network(
        fit: BoxFit.cover,
        'https://img.freepik.com/free-vector/eid-mubarak-sale-dark-banner-template-design_1017-18673.jpg?size=626&ext=jpg'),
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
        const Color(0xff26836AF626),
  ];

  List exploreColors =
  [
    const Color(0xff1A53B175),
    const Color(0xff1AF8A44C),
    const Color(0xff33F7A593),
    const Color(0xff40D3B0E0),
    const Color(0xff40B7DFF5),
    const Color(0xff26836AF6),
  ];

  List borderColors =
  [
    const Color(0xffB353B175),
    const Color(0xffB3F8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffB3FDE598),
    const Color(0xff80836AF6),
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

  UserModel? userModel;
  void getUserData() {
    emit(GetUserLoadingState());
    // print("$uId -------------------------- Error Solved ------------------------0");
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJason(value.data()!);
      print("${userModel!.name} --------------------------------------------------------1");
      print("${userModel!.email} --------------------------------------------------------2");
      emit(GetUserSuccessState());
    }).catchError((error) {
        print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  // Image Picker Function
  File? profileImage;
  var picker = ImagePicker();

  // For Profile Image
  Future<void> pickProfileImage() async {
    final XFile? pickedProfileFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedProfileFile != null) {
      profileImage = File(pickedProfileFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(ProfileImagePickedErrorState());
    }
  }

  // For Upload Profile Image
  String profileImageUrl = '';
  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      emit(UploadProfileImageSuccessState());
      value.ref.getDownloadURL().then((value) {
        print(value);
        profileImageUrl = value;
        UserModel userUpdateModel = UserModel(
            name: userModel!.name,
            email: userModel!.email,
            uId: userModel!.uId,
            image: profileImageUrl);
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .update(userUpdateModel.toMap())
            .then((value) {
          getUserData();
          emit(ProfilePickAndUploadSuccessState());
        }).catchError((error) {
          emit(ProfilePickAndUploadErrorState());
        });
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void userDateUpdate({required String name, required String email}) {
    emit(UpdateUserLoadingState());
    UserModel userUpdateModel = UserModel(
        name: name,
        email: email,
        uId: userModel!.uId,
        image: userModel!.image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(userUpdateModel.toMap())
        .then((value) {
      getUserData();
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      emit(UpdateUserErrorState());
    });
  }

  List<ProductModel> exclusiveOffer= [];
  List<ProductModel> exclusiveImage= [];
  List<ProductModel> bestImage= [];
  List<ProductModel> allImage= [];
  List<ProductModel> bestSelling= [];
  List<ProductModel> all = [];

  void getExclusiveProduct()
  {
    emit(GetExclusiveProductLoadingState());
    FirebaseFirestore.instance.collection('products')
        .doc('ISePGBibLymHHzeWGpr6').collection('Exclusive Offer')
        .get().then((value)
    {
      for (var element in value.docs)
      {
        exclusiveOffer.add(ProductModel.fromJason(element.data()));
      }

      print('${exclusiveOffer[1].name} --------------------------------------------- 3');
      emit(GetExclusiveProductSuccessState());
    }
    )
        .catchError((error)
    {
      print(error.toString());
        emit(GetExclusiveProductErrorState());
    });
  }

  void getBestSellingProduct()
  {
    emit(GetBestSellingProductLoadingState());
    FirebaseFirestore.instance.collection('products')
        .doc('ISePGBibLymHHzeWGpr6').collection('Best Selling')
        .get().then((value)
    {
      for (var element in value.docs)
      {
        bestSelling.add(ProductModel.fromJason(element.data()));

      }
      print('${bestSelling[3].carbs} --------------------------------------------- 4');
      emit(GetBestSellingProductSuccessState());
    }
    )
        .catchError((error)
    {
      print(error.toString());
      emit(GetBestSellingProductErrorState());
    });
  }

  void getAllProduct()
  {
    emit(GetAllProductLoadingState());
    FirebaseFirestore.instance.collection('products')
        .doc('ISePGBibLymHHzeWGpr6').collection('All')
        .get().then((value)
    {
      for (var element in value.docs)
      {
        all.add(ProductModel.fromJason(element.data()));
      }
      print('${all[1].name} --------------------------------------------- 5');
      emit(GetAllProductSuccessState());
    }
    )
        .catchError((error)
    {
      print(error.toString());
      emit(GetAllProductErrorState());
    });
  }

  List<ProductModel> pulses= [];
  List<ProductModel> rice = [];

  void getPulses()
  {
    emit(GetCategoriesLoadingState());
    FirebaseFirestore.instance.collection('categories')
        .doc('eXG4WCFFkSC1JHoJ6P4D').collection('Pulses')
        .get().then((value)
    {
      for (var element in value.docs)
      {
        pulses.add(ProductModel.fromJason(element.data()));
      }
      print('${all[1].name} --------------------------------------------- 6');
      emit(GetCategoriesSuccessState());
    }
    )
        .catchError((error)
    {
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }

  void getRice()
  {
    emit(GetCategoriesLoadingState());
    FirebaseFirestore.instance.collection('categories')
        .doc('eXG4WCFFkSC1JHoJ6P4D').collection('Rice')
        .get().then((value)
    {
      for (var element in value.docs)
      {
        rice.add(ProductModel.fromJason(element.data()));
      }
      print('${all[1].name} --------------------------------------------- 6');
      emit(GetCategoriesSuccessState());
    }
    )
        .catchError((error)
    {
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }



  void increaseQuantity({required int quantity})
  {
    if(quantity == 20)
    {
      quantity = 20;
    }
    else
    {
      quantity++;
    }
    emit(IncreaseAndDecreaseQuantity());
  }

  void decreaseQuantity({required int quantity})
  {
    if(quantity == 1)
    {
      quantity = 1;
    }
    else
    {
      quantity--;
    }
    emit(IncreaseAndDecreaseQuantity());
  }
}



