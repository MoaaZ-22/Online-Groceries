import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/shared/components/components.dart';
import '../../shared/styles/colors.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      textDirection:TextDirection.ltr,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/OnBoardingImage.png')
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                  height: 56.36,width: 48.47,
                  'assets/images/Logo.svg'),
              const SizedBox(height: 30,),
              const Text('Welcome',
                textAlign: TextAlign.justify, textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 48,fontFamily: 'GilroySemiBold',color: Colors.white),),
              const Text('to our store',
                textAlign: TextAlign.justify, textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 48,fontFamily: 'GilroySemiBold',color: Colors.white),),
              const SizedBox(height: 8,),
              Text('Ger your groceries in as fast as one hour',
                textAlign: TextAlign.justify, textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,fontFamily: 'GilroyMedium',color: defaultGreyColor),),
              const SizedBox(height: 30,),
              ReusableTextButton(
                textColor: Colors.white,
                color: defaultColor,
                buttonText: 'Get Started',onPressed: ()
              {
                submit(context);
              },),
              const SizedBox(height: 50.84,),
            ],
          ),
        )
      ],
    );
  }
}
