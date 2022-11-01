

abstract class AppStates {}

class InitialAppState extends AppStates {}

class NavBarChangeIndex extends AppStates{}

class SmoothPageIndex extends AppStates{}

class SmoothDetailsPageIndex extends AppStates{}

class ChangeItemFavorites extends AppStates{}

class GetUserLoadingState extends AppStates{}

class GetUserSuccessState extends AppStates{}

class GetUserErrorState extends AppStates {

  final String error;

  GetUserErrorState(this.error);


}

class ProfileImagePickedSuccessState extends AppStates{}

class ProfileImagePickedErrorState extends AppStates{}

class ProfilePickAndUploadSuccessState extends AppStates{}

class ProfilePickAndUploadErrorState extends AppStates{}

class UploadProfileImageSuccessState extends AppStates{}

class UploadProfileImageErrorState extends AppStates{}

class UpdateUserLoadingState extends AppStates{}
class UpdateUserSuccessState extends AppStates{}
class UpdateUserErrorState extends AppStates{}

class GetExclusiveProductLoadingState extends AppStates{}
class GetExclusiveProductSuccessState extends AppStates{}
class GetExclusiveProductErrorState extends AppStates{}

class GetBestSellingProductLoadingState extends AppStates{}
class GetBestSellingProductSuccessState extends AppStates{}
class GetBestSellingProductErrorState extends AppStates{}

class GetAllProductLoadingState extends AppStates{}
class GetAllProductSuccessState extends AppStates{}
class GetAllProductErrorState extends AppStates{}

class GetCategoriesLoadingState extends AppStates{}
class GetCategoriesSuccessState extends AppStates{}
class GetCategoriesErrorState extends AppStates{}