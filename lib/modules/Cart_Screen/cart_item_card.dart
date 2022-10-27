import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icons.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.17,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              height: double.infinity,
              width: 80,
              'assets/images/pepper red.png'),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Bell Pepper Red',
                style: TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'GilroyBold',),),
              Text('7pcs, Priceg', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: defaultGreyColor, fontSize: 14, fontFamily: 'GilroyMedium'),),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17),side: const BorderSide(color: Color(0xffF0F0F0))),
                    minWidth: 0,
                    child: Icon(
                      IconlyBroken.minus__1_,
                      size: 25,
                      color: defaultGreyColor,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  const Text(
                    '1',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 8,),
                  MaterialButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17),side: const BorderSide(color: Color(0xffF0F0F0))),
                    minWidth: 0,
                    child: Icon(
                      IconlyBroken.plus,
                      size: 25,
                      color: defaultColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                  borderRadius: BorderRadius.circular(30),
                  radius: 30,
                  onTap:(){},
                  child: Icon(
                    Icons.close,
                    color: defaultGreyColor,
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('\$4.99', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18, color: Colors.black, fontFamily: 'GilroyBold'),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}