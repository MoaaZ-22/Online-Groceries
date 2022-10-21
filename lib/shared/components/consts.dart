import 'package:flutter/material.dart';
import 'package:online_groceries_app/modules/Register_Screen/register_screen.dart';
import '../network/local/cache_helper.dart';

String? token = '';

final GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

// Function For Navigate To Other Screens And Cant Return
void pushReplacementNavigate(context, dynamic widget) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void signOut(context)
{
  CacheHelper.removeUserData(key: 'accessToken').then((value)
  {
    if (value!)
    {
      pushReplacementNavigate(context , const RegisterScreen());
    }
  });
}