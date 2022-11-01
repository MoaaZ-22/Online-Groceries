import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/layout/home_layout_screen.dart';
import 'package:online_groceries_app/modules/Login_Screen/login_screen.dart';
import 'package:online_groceries_app/modules/Onboarding%20Screen/onboarding_screen.dart';
import 'package:online_groceries_app/shared/bloc_observer.dart';
import 'package:online_groceries_app/shared/components/consts.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/network/local/cache_helper.dart';
import 'package:online_groceries_app/shared/network/remote/dio_helper.dart';
import 'package:online_groceries_app/shared/styles/themes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  await Firebase.initializeApp();

  // bool to Check If User See onBoarding
  bool? onBoarding = CacheHelper.getDataIntoShPre(key: 'Onboarding');

  // String To Check If User Login Or Not
  uId = CacheHelper.getDataIntoShPre(key: 'uId');

  late Widget widget;
  if(onBoarding != null)
    {
      if(uId != null) {
        widget = const HomeLayoutScreen();
      } else {
        widget = const LoginScreen();
      }
    }
  else
    {
      widget = const OnBoardingScreen();
    }
  Bloc.observer = OnlineGroceriesBlocObserver();
  runApp(OnlineGroceries(startWidget: widget,));
}
class OnlineGroceries extends StatelessWidget {
  final Widget startWidget;
  const OnlineGroceries({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => AppCubit()..getUserData()..getExclusiveProduct()..getBestSellingProduct()..getAllProduct()..getPulses()..getRice(),),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
        theme: appLightTheme,
    ),
    );
  }
}

