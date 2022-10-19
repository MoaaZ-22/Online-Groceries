import 'package:flutter/material.dart';

// Function For Navigate To Other Screens And Cant Return
void pushReplacementNavigate(context, dynamic widget) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

// void signOut(context)
// {
//   CacheHelper.removeUserData(key: 'accessToken').then((value)
//   {
//     if (value!)
//     {
//       pushReplacementNavigate(context , const LoginRegisterScreen());
//       LaVieAppCubit.get(context).bottomNavBarCurrentIndex = 2;
//     }
//   });
// }