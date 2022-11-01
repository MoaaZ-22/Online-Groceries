import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/styles/colors.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateKey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state)
      {
        if(state is UpdateUserSuccessState)
          {
            snackBar(context: context, backgroundColor: defaultColor, text: 'Your personal Information has been Updated');
          }
        else if (state is UpdateUserErrorState)
          {
            snackBar(context: context, backgroundColor: Colors.red, text: 'Error when updated your data, try again later');
          }
      },
      builder: (context, state)
      {
        var userModel = AppCubit.get(context).userModel;
        TextEditingController nameTextController = TextEditingController();
        TextEditingController emailTextController = TextEditingController();
        nameTextController.text = userModel!.name!;
        emailTextController.text = userModel.email!;
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                'Update',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'GilroyBold',
                    letterSpacing: 0.8),
              ),
              leading: IconButton(
                splashRadius: 20,
                 icon: const Icon(
          IconlyBroken.arrow_left_square,
            size: 28,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
          body: Align(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: updateKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        height: 80,
                        width: 80,
                        'assets/images/OrangeLogo.svg'),
                    const SizedBox(height: 20,),
                    ReusableTextFormFiled(
                        hintText: userModel.name,
                        labelText: 'Name',
                        isPassword: false,
                        textInputType: TextInputType.name,
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'Name Must Not be Empty';
                          }
                          return null;

                        },
                        controller: nameTextController
                    ),
                    const SizedBox(height: 10,),
                    ReusableTextFormFiled(
                        hintText: userModel.email,
                        labelText: 'Email',
                        isPassword: false,
                        textInputType: TextInputType.emailAddress,
                        validator: (value)
                        {
                          if (value!.isEmpty)
                          {
                            return 'Name Must Not be Empty';
                          }
                          return null;

                        },
                        controller: emailTextController
                    ),
                    const SizedBox(height: 60,),
                    ConditionalBuilder(
                      condition: state is! UpdateUserSuccessState,
                      builder: (context)
                      {
                        return ReusableTextButton(buttonText: 'Update',
                          color: defaultColor,
                          textColor: Colors.white,
                          onPressed: ()
                          {
                            if(updateKey.currentState!.validate())
                            {
                              AppCubit.get(context).userDateUpdate(name: nameTextController.text, email: emailTextController.text);
                            }
                          },
                        );
                      },
                      fallback: (context) => circularProIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
