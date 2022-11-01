import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/modules/Account_Screen/update_screen.dart';
import 'package:online_groceries_app/shared/components/consts.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/colors.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/icons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){
        if (state is ProfileImagePickedSuccessState)
        {
          AppCubit.get(context).uploadProfileImage();
        }
      },
      builder: (context, state)
      {
        var userModel = AppCubit.get(context).userModel;
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                ReusableTextButton(buttonText: 'Log Out', onPressed: (){
                  signOut(context);
                },color: const Color(0xffF2F3F2),textColor: Colors.black,),
                Positioned(
                  right: 25,
                  child:  Icon(IconlyBroken.logout,color: defaultColor,size: 30,),
                )],
            ),),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 120,
            shape: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1)
            ),
            title: Row(
              children:
              [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
                          width: 63.44,
                          height: 64.32,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(27),
                              image: DecorationImage(image: NetworkImage(userModel!.image!))
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 20,
                        iconSize: 35,
                        icon: CircleAvatar(
                          backgroundColor: Colors.grey.shade200.withOpacity(0.70),
                          radius: 20,
                          child: Icon(IconlyBroken.camera,color: defaultColor,),
                        ), onPressed: () {
                          AppCubit.get(context).pickProfileImage();
                      },
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          userModel.name!, style: const TextStyle(fontSize: 18, fontFamily: 'GilroyBold', color: Colors.black),),
                      ],
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      userModel.email!, style: TextStyle(fontSize: 14, fontFamily: 'GilroyRegular', color: defaultGreyColor),)
                  ],
                ),

              ],
            ),),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll){
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              scrollDirection: Axis.vertical,
              child: Column(
                children:
                [
                  ReusableAccount(text: 'Order', prefixIcon: Icons.shopping_bag_outlined,onPressed: (){},),
                  ReusableAccount(text: 'My Details', prefixIcon: Icons.person_outline,onPressed: ()
                  {
                    navigateTo(context, const UpdateScreen());
                  },),
                  ReusableAccount(text: 'Delivery Address', prefixIcon: Icons.location_on_outlined,onPressed: (){},),
                  ReusableAccount(text: 'Payment Methods', prefixIcon: Icons.credit_card_outlined,onPressed: (){},),
                  ReusableAccount(text: 'Promo Cord', prefixIcon: Icons.event,onPressed: (){},),
                  ReusableAccount(text: 'Notifications', prefixIcon: Icons.notifications_none_sharp,onPressed: (){},),
                  ReusableAccount(text: 'Help', prefixIcon: Icons.help_outline_outlined,onPressed: (){},),
                  ReusableAccount(text: 'About', prefixIcon: Icons.info_outline,onPressed: (){},),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}