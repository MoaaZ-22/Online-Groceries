
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/shared/bloc_observer.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/network/local/cache_helper.dart';
import 'package:online_groceries_app/shared/network/remote/dio_helper.dart';
import 'modules/Onboarding Screen/onboarding_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  // late Widget widget;
  //
  // if(accessToken != null) {
  //   widget = const HomeScreen();
  // } else {
  //   widget = const LoginRegisterScreen();
  // }

  Bloc.observer = OnlineGroceriesBlocObserver();
  runApp(const OnlineGroceries());
}

class OnlineGroceries extends StatelessWidget {
  const OnlineGroceries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit(),),

      ],
      child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    ),
    );
  }
}

