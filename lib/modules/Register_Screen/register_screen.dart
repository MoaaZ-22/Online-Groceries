import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_groceries_app/modules/Login_Screen/login_screen.dart';
import 'package:online_groceries_app/modules/Register_Screen/Register_Cubit/Register_Cubit/cubit.dart';
import 'package:online_groceries_app/modules/Register_Screen/Register_Cubit/Register_Cubit/states.dart';
import 'package:online_groceries_app/shared/components/consts.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icons.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerKey = GlobalKey<FormState>();
    TextEditingController registerNameTextController = TextEditingController();
    TextEditingController registerEmailTextController = TextEditingController();
    TextEditingController registerPasswordTextController = TextEditingController();
    return BlocProvider(
      create:(context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){
          if(state is RegisterSuccessState)
            {
              pushReplacementNavigate(context, const LoginScreen());
              ScaffoldMessenger.of(context).showSnackBar(SnackBar
                (
                  backgroundColor: defaultColor,
                  elevation: 5,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                  content: const Text('Your account successfully created, now login !',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14,fontFamily: 'GilroySemiBold'),)));
            } else if (state is RegisterErrorState)
            {
              showToast(message: 'Error With Your Data', state: ToastStates.error);
            }
        },
        builder: (context, state)
        {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
          SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,

              )
          );
          var registerCubit = RegisterCubit.get(context);
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
                                  const Text('Sign Up',style: TextStyle(fontSize: 26,color: Colors.black,fontFamily: 'GilroySemiBold'),),
                                  const SizedBox(height: 15,),
                                  Text('Enter your credentials to continue',style: TextStyle(fontSize: 16,color: defaultGreyColor,fontFamily: 'GilroyMedium'),)
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
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                        child: Form(
                          key: registerKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableTextFormFiled(
                                controller: registerNameTextController,
                                validator: (value) => registerCubit.userName(value),
                                labelText: 'Name',
                                isPassword: false,
                                textInputType: TextInputType.name,
                              ),
                              const SizedBox(height: 30,),
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  ReusableTextFormFiled(
                                    controller: registerEmailTextController,
                                    validator: (value) => registerCubit.emailValidation(value),
                                    labelText: 'Email',
                                    onChanged: (value)
                                    {
                                      registerCubit.emailRegExpCorrect(value);
                                    },
                                    isPassword: false,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  registerCubit.isEmailCorrect && registerEmailTextController.text.isNotEmpty ? Positioned(
                                      bottom: 10,
                                      child: Icon(Icons.check,color: defaultColor,size: 25,)) : const SizedBox()
                                ],
                              ),
                              const SizedBox(height: 30,),
                              ReusableTextFormFiled(
                                controller: registerPasswordTextController,
                                validator: (value) => registerCubit.passwordValidation(value),
                                labelText: 'Password',
                                isPassword: registerCubit.isPasswordShow ? false : true,
                                textInputType: TextInputType.visiblePassword,
                                suffixIcon: registerCubit.isPasswordShow ? IconlyBroken.hide:IconlyBroken.show,
                                suffixIconFunc: ()
                                {
                                  registerCubit.showPasswordRegisterScreen();
                                },
                              ),
                              const SizedBox(height: 20,),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 13.5,
                                      fontFamily:'GilroyMedium',
                                      height: 1.5
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'By continuing you agree to our ',style: TextStyle(color: Colors.black)),
                                    TextSpan(text: 'Terms of Service ', style: TextStyle(color: defaultColor,)),
                                    const TextSpan(text: 'and ', style: TextStyle(color: Colors.black,)),
                                    TextSpan(text: 'Privacy Policy.', style: TextStyle(color: defaultColor,)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),
                              ConditionalBuilder(condition: state is! RegisterLoadingState,
                                  builder: (context)
                              {
                                return ReusableTextButton(
                                  buttonText: 'Sign Up',onPressed: ()
                                {
                                  if(registerKey.currentState!.validate())
                                  {
                                    registerCubit.createUser
                                      (
                                      name: registerNameTextController.text,
                                      email: registerEmailTextController.text,
                                      password: registerPasswordTextController.text,
                                    );
                                  }
                                },);
                              }, fallback: (context) => circularProIndicator()),
                              const SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account ?',
                                    style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'GilroySemiBold'
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  //done
                                  InkWell(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'GilroySemiBold',
                                          color: defaultColor),
                                    ),
                                    onTap: () {
                                      // Navigate to Register Screen
                                      pushReplacementNavigate(context, const LoginScreen());
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
