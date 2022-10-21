

import '../../../../models/Register_Model/register_model.dart';

abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}


// Show Password In Register Screen
class ShowPasswordRegisterScreen extends RegisterStates{}

class ShowCorrectEmailRegisterScreen extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  // Model
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates{
  final String? error;

  RegisterErrorState({required this.error});
}