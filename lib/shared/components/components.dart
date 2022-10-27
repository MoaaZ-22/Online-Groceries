// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../layout/home_layout_screen.dart';
import '../../modules/Login_Screen/login_screen.dart';
import '../cubit/cubit.dart';
import '../network/local/cache_helper.dart';
import '../styles/colors.dart';
import '../styles/icons.dart';
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
  final Color color;
  final Color textColor;
  const ReusableTextButton({Key? key, this.buttonText, this.onPressed, required this.color, required this.textColor}) : super(key: key);

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
              backgroundColor: color,
              alignment: AlignmentDirectional.center
          ),
          onPressed: onPressed, child:  Text(
        textDirection: TextDirection.ltr,
        buttonText!,style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18,fontFamily: 'GilroySemiBold',color: textColor),)),
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

class ReusableHomeRowText extends StatelessWidget {
  final String text;
  final void Function()? seeAllFunction;
  final double? leftPadding;
  final double? rightPadding;
  const ReusableHomeRowText({Key? key, required this.text, this.seeAllFunction,this.leftPadding, this.rightPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 0, right: rightPadding ?? 0),
      child: Row(
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyText1,),
          const Spacer(),
          MaterialButton(
            height: 25,
            minWidth: 0,
            padding: const EdgeInsets.only(left: 2,right: 2),
            elevation: 0,
            onPressed: seeAllFunction,
            child: Text('See all', style: Theme.of(context).textTheme.bodyText2),
          ),
          const SizedBox(width: 15,)
        ],
      ),
    );
  }
}

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

PreferredSizeWidget reusableAppBar({required String? appBarText, required double? toolbarHeight, required bool? centerTitle})
  {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: Colors.white,
      toolbarHeight: toolbarHeight,
      elevation: 0,
      shape: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1)
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(appBarText!, style: const TextStyle(fontSize: 20,color: Colors.black, fontFamily: 'GilroyBold'),),
      ),
    );
  }

  class ReusableAccount extends StatelessWidget {
    final String text;
    final IconData prefixIcon;
    final void Function()? onPressed;
    const ReusableAccount({Key? key, required this.text, required this.prefixIcon, this.onPressed}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialButton(onPressed: onPressed,
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1)
        ),
        height: 50,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
        child: Row(
          children:
          [
            Icon(prefixIcon,size: 20,color: Colors.black,),
            const SizedBox(width: 10,),
            Text(text, style: const TextStyle(fontSize: 18, fontFamily: 'GilroySemiBold'),),
            const Spacer(),
            const Icon(IconlyBroken.arrow_right_2)
          ],
        ),
      );
    }
  }

class ReusableShowModalBottomSheet extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget widget;
  const ReusableShowModalBottomSheet({Key? key, required this.text, this.onPressed, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: defaultGreyColor, fontSize: 18,),),
          const Spacer(),
          widget,
          const SizedBox(width: 10,),
          const Icon(
            IconlyBroken.arrow_right_2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

Future dialogBox(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                radius: 60,
                onTap:(){
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                )),
          ),
          const SizedBox(height: 15,),
          Center(
            child: Image.asset(
              'assets/images/image 13.png',width: 200,height: 200,),
          ),
          const SizedBox(height: 20,),
          Text('Oops! Order Failed', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 26, color: Colors.black),),
          const SizedBox(height: 10,),
          Text('Something went temblor wrong.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontFamily: 'GilroyMedium', color: defaultGreyColor),
          ),
          const SizedBox(height: 60,),
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
    ));








