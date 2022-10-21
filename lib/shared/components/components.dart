// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../modules/Login_Screen/login_screen.dart';
import '../network/local/cache_helper.dart';
import '../styles/colors.dart';
import '../styles/slide_transition_animation.dart';
import 'consts.dart';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// Function For Navigate To Other Screens
void navigateTo(context, dynamic widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget),);

void navigateWithAnimation(context, dynamic widget, AxisDirection direction) => Navigator.push(context, SlideTransitionAnimation(child: widget,direction: direction),);

// Flutter Toast Components
Future<bool?> showToast({required String message, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// For Choose Color Of Toast
enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget circularProIndicator() => Center(
  child: SizedBox(
    width: 20,
    height: 60,
    child: CircularProgressIndicator(
      color: defaultColor,
      strokeWidth: 5,
    ),
  ),
);

class ReusableTextFormFiled extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final bool? isPassword;
  final void Function()? suffixIconFunc;
  const ReusableTextFormFiled({Key? key, this.labelText, required this.controller,required this.validator, this.suffixIcon, this.suffixIconFunc, this.textInputType, this.isPassword, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isPassword!,
      style: const TextStyle(fontFamily: 'GilroyMedium',fontSize: 18,wordSpacing: 5,letterSpacing: 1),
      decoration: InputDecoration(
        labelText: labelText,
        errorStyle: const TextStyle(fontFamily: 'GilroySemiBold',fontSize: 12),
        suffixIcon: suffixIcon != null ? IconButton(
          splashRadius: 25,
            color: defaultGreyColor,
            onPressed: suffixIconFunc,
            icon: Icon(suffixIcon))
            : null,
        labelStyle: TextStyle(fontSize: 16,color: defaultGreyColor,fontFamily: 'GilroySemiBold'),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffE2E2E2))),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}

class ReusableTextButton extends StatelessWidget {
  final String? buttonText;
  final void Function()? onPressed;
  const ReusableTextButton({Key? key, this.buttonText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18), // <-- Radius
              ),
              backgroundColor: defaultColor,
              alignment: AlignmentDirectional.center
          ),
          onPressed: onPressed, child:  Text(
        textDirection: TextDirection.ltr,
        buttonText!,style: const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18,fontFamily: 'GilroySemiBold',color: Colors.white),)),
    );
  }
}

// Method For Save In cache To Skip OnBoarding Screen When User Open
void submit(BuildContext context)
{
  CacheHelper.saveData(key: 'Onboarding', value: true).then((value) =>
  {
    pushReplacementNavigate(context, const LoginScreen())
  }
  );
}


