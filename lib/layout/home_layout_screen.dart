import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';

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
            bottomNavigationBar: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius:1.5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(15),topEnd: Radius.circular(15)),
                child: BottomNavigationBar(
                  currentIndex: appCubit.bottomNavigationBarCurrentIndex!,
                  onTap: (index)
                  {
                    appCubit.changeBottomNavIndex(index);
                  },
                  items: appCubit.bottomNavListItem,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 0,
              elevation: 0,
            ),
            body: appCubit.homeLayoutScreens[appCubit.bottomNavigationBarCurrentIndex!],
            backgroundColor: Colors.white,
          );
        });
  }
}
