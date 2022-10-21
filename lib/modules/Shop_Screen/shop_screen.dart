import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';

import '../../shared/styles/colors.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
              height: 30.8,
              width:26.48,
              'assets/images/OrangeLogo.svg'),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(size: 22, Icons.location_on_rounded,color: Color(0xff4C4F4D),),
              Text('Giza, 6 October',style: TextStyle(fontSize: 18,color: Color(0xff4C4F4D),fontFamily: 'GilroySemiBold'),)
            ],
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: searchBackgroundColor,
                elevation: 0,
              ),
              onPressed: () {
                print('Search Screen');
              },
              child: SizedBox(
                height: 45,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    const Icon(
                      IconlyBroken.search,
                      size: 20,
                      color: Colors.black
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search Store',
                      style: TextStyle(
                        fontFamily: 'GilroyRegular',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: defaultGreyColor),
                    )
                  ],
                ),
              )),

        ],
      ),
    );
  }
}
