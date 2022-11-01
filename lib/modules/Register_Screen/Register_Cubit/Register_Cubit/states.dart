abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

// Show Password In Register Screen
class ShowPasswordRegisterScreen extends RegisterStates{}

class ShowCorrectEmailRegisterScreen extends RegisterStates{}

class CreateUserSuccessState extends RegisterStates{}

class CreateUserErrorState extends RegisterStates{
  final String error;

  CreateUserErrorState({required this.error});
}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  final String? error;

  RegisterErrorState({required this.error});
}