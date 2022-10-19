// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/modules/Register_Screen/Register_Cubit/Register_Cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  // Register Show Password
  bool isPasswordShow = false;

  // Register Confirm Show Password
  bool isEmailCorrect = false;

  // Function For Show And Hide Password In Register Screen
  void showPasswordRegisterScreen() {
    isPasswordShow = !isPasswordShow;
    emit(ShowPasswordRegisterScreen());
  }


  // Validation Function For User Name
  String? userName(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value!.length > 27)
    {
      return 'User name length too much';
    }
    return null;
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
        isEmailCorrect = true;
      }
    else
      {
        isEmailCorrect = false;
      }
    emit(ShowCorrectEmailRegisterScreen());
  }
}
