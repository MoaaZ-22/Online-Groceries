// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/modules/Login_Screen/Login_Cubit/states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);


  // Login Show Password
  bool isLoginPasswordShow = false;

  // Login Confirm Show Password
  bool isLoginEmailCorrect = false;

  // Function For Show And Hide Password In Login Screen
  void showPasswordLoginScreen() {
    isLoginPasswordShow = !isLoginPasswordShow;
    emit(ShowPasswordLoginScreen());
  }

  // Validation Function For Email
  String? emailValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
    {
      return 'Please enter a valid email address';
    }
    return null;

  }

  // Validation Function For Email
  String? passwordValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value.trim().length < 8)
    {
      return 'Password must be at least 8 characters in length';
    }
    return null;

  }

  void emailRegExpCorrect(String value)
  {
    if(RegExp( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value))
      {
        isLoginEmailCorrect = true;
      }
    else
      {
        isLoginEmailCorrect = false;
      }
    emit(ShowCorrectEmailLoginScreen());
  }
}
