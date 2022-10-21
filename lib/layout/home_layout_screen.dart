import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/colors.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var appCubit = AppCubit.get(context);
          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 0,
              elevation: 0,
            ),
            body: appCubit.homeLayoutScreens[appCubit.bottomNavigationBarCurrentIndex!],
            backgroundColor: Colors.white,
            bottomNavigationBar: SizedBox(
              height: 82,
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(15),topEnd: Radius.circular(15)),
                child: BottomNavigationBar(
                  currentIndex: appCubit.bottomNavigationBarCurrentIndex!,
                  elevation: 10,
                  onTap: (index)
                  {
                    appCubit.changeBottomNavIndex(index);
                  },
                  items: appCubit.bottomNavListItem,
                ),
              ),
            ),
          );
        });
  }
}
