// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/modules/Login_Screen/Login_Cubit/cubit.dart';
import 'package:online_groceries_app/modules/Login_Screen/Login_Cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import '../../layout/home_layout_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/consts.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/styles/colors.dart';
import '../Register_Screen/register_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
    );
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    return BlocProvider(
      create:(context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>
      (
        listener: (context, state){
          if(state is LoginSuccessState)
            {
              CacheHelper.saveData(key: 'token', value: state.loginModel.user?.token).then((value) =>
              {

                token = CacheHelper.getDataIntoShPre(key: 'token'),
                emailTextController.clear(),
                passwordTextController.clear(),
                pushReplacementNavigate(context, const HomeLayoutScreen())
              });
            }
        },
        builder: (context, state)
        {

          var loginCubit = LoginCubit.get(context);
          return Scaffold(
              extendBody: true,
              backgroundColor: Colors.white,
              body: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.33,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/logintop.png')
                              ),),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text('Login',style: TextStyle(fontSize: 26,color: Colors.black,fontFamily: 'GilroySemiBold'),),
                                  const SizedBox(height: 15,),
                                  Text('Enter your emails and password',style: TextStyle(fontSize: 16,color: defaultGreyColor,fontFamily: 'GilroyMedium'),)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: 40,
                              child:  SvgPicture.asset('assets/images/OrangeLogo.svg'))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: loginKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  ReusableTextFormFiled(
                                    controller: emailTextController,
                                    validator: (value) => loginCubit.emailValidation(value),
                                    labelText: 'Email',
                                    isPassword: false,
                                    onChanged: (value)
                                    {
                                      loginCubit.emailRegExpCorrect(value);
                                    },
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  loginCubit.isLoginEmailCorrect && emailTextController.text.isNotEmpty ?
                                  Positioned(
                                      bottom: loginKey.currentState!.validate() ? 20:10,
                                      child: Icon(Icons.check,color: defaultColor,size: 25,)) :
                                  const SizedBox()
                                ],
                              ),
                              const SizedBox(height: 40,),
                              ReusableTextFormFiled(
                                controller: passwordTextController,
                                validator: (value) => loginCubit.passwordValidation(value),
                                labelText: 'Password',
                                isPassword: loginCubit.isLoginPasswordShow ? false:true,
                                textInputType: TextInputType.visiblePassword,
                                suffixIcon: loginCubit.isLoginPasswordShow ? IconlyBroken.hide:IconlyBroken.show,
                                suffixIconFunc: () => loginCubit.showPasswordLoginScreen(),
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: InkWell(
                                    onTap: (){
                                      print('Forgot Password?');
                                    },
                                    child: const Text('Forgot Password?',style: TextStyle(fontSize: 14,fontFamily: 'GilroyMedium'),)),
                              ),
                              const SizedBox(height: 30,),
                              ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (context){
                                    return ReusableTextButton(
                                      buttonText: 'Log in',onPressed: ()
                                    {
                                      if(loginKey.currentState!.validate())
                                      {
                                        loginCubit.login(email: emailTextController.text, password: passwordTextController.text);
                                      }
                                    },);
                                  },
                                  fallback: (context) =>circularProIndicator()),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account ?',
                                    style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'GilroySemiBold'
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  //done
                                  InkWell(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'GilroySemiBold',
                                          color: defaultColor),
                                    ),
                                    onTap: () {
                                      // Navigate to Register Screen
                                      navigateTo(context, const RegisterScreen());
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
