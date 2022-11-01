// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/modules/Register_Screen/Register_Cubit/Register_Cubit/states.dart';
import '../../../../models/User_Model/user_model.dart';

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

  // Method For Pass Data To Firebase With Name And Password
  void userRegister({required String name, required String email, required String password})
  {
    emit(RegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(name: name, email: email, uId:value.user!.uid);
      emit(RegisterSuccessState());
    }).catchError((error){
      print('${error.toString()} ******************************************************');
      emit(RegisterErrorState(error: error.toString()));
    });
  }

  void userCreate({required String name, required String email, required String uId})
  {
    // Call User Model That I Create It
    UserModel userModel = UserModel(
        name: name,
        email: email,
        uId: uId,
        image:'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740',
    );

    FirebaseFirestore.instance.
    collection("users").
    doc(uId)
        .set(userModel.toMap()).then((value)
    {
     emit(CreateUserSuccessState());
    }).catchError((error){
      print("${error.toString()}**********************************");
      emit(CreateUserErrorState(error: error.toString()));
    });

  }


}
