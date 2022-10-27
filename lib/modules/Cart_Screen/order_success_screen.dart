import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_groceries_app/layout/home_layout_screen.dart';
import 'package:online_groceries_app/shared/components/consts.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/styles/colors.dart';

import '../../shared/components/components.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              height: MediaQuery.of(context).size.height*0.47,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/accepted.png')
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                child: Lottie.asset(
                  'assets/success.json',
                  width: double.infinity,
                  animate: true,
                  repeat: false,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 25),
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.54,
              color: Colors.white,
              child: Column(
                children: [
                  Text('Your Order has been accepted', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 28, color: Colors.black),),
                  const SizedBox(height: 30,),
                  Text('Your items has been placed and is on it’s way to being processed',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontFamily: 'GilroyMedium', color: defaultGreyColor),
                  ),
                  const Spacer(),
                  ReusableTextButton(buttonText: 'Track Order', color: defaultColor, textColor: Colors.white, onPressed: (){},),
                  const SizedBox(height: 20,),
                  InkWell(
                      onTap: (){
                        AppCubit.get(context).bottomNavigationBarCurrentIndex = 0;
                        pushReplacementNavigate(context, const HomeLayoutScreen());
                      },
                      child: Text('Back to home', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18, color: Colors.black),)),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
