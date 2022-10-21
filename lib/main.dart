
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/layout/home_layout_screen.dart';
import 'package:online_groceries_app/modules/Login_Screen/login_screen.dart';
import 'package:online_groceries_app/modules/Onboarding%20Screen/onboarding_screen.dart';
import 'package:online_groceries_app/shared/bloc_observer.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/network/local/cache_helper.dart';
import 'package:online_groceries_app/shared/network/remote/dio_helper.dart';
import 'package:online_groceries_app/shared/styles/colors.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  // bool to Check If User See onBoarding
  bool? onBoarding = CacheHelper.getDataIntoShPre(key: 'Onboarding');

  // String To Check If User Login Or Not
  String? token = CacheHelper.getDataIntoShPre(key: 'token');

  late Widget widget;
  if(onBoarding != null)
    {
      if(token != null) {
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
        BlocProvider(create: (BuildContext context) => AppCubit(),),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )
          ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: TextStyle(
                  fontSize: 12, fontFamily: 'GilroySemiBold',color: defaultColor,height: 1.5),
              unselectedLabelStyle: const TextStyle(height: 1.5,
                  fontSize: 12, fontFamily: 'GilroySemiBold',color: Color(0xff181725)),
              selectedItemColor: defaultColor,
              unselectedItemColor: const Color(0xff181725),
              selectedIconTheme: IconThemeData(
                size: 22,
                color: defaultColor,
              ),
              unselectedIconTheme: const IconThemeData(
                  color:Color(0xff181725),
                  size: 25
              ),
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white
        ),
    ),
    );
  }
}

