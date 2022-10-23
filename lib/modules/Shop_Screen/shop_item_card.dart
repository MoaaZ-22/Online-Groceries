import 'package:flutter/material.dart';
import 'package:online_groceries_app/shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icons.dart';
import 'item_details.dart';

class ShopItemCard extends StatelessWidget {
  final String? name;
  final String? image;
  const ShopItemCard({Key? key, this.name, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: ()
      {
        navigateTo(context, const ItemDetails());
      },
      child: Container(
        width: 173.32,
        height: 248.51,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: defaultGreyColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Image.asset(
                height: MediaQuery.of(context).size.height*0.16,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                image!),
            const Spacer(),
            Text(name!,
              style: const TextStyle(fontSize: 16,
                  fontFamily: 'GilroyRegular',
                  fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text('7pcs, Priceg', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: defaultGreyColor, fontSize: 14),),
            const SizedBox(height: 10,),
            Row(
              children:
              [
                Text('\$4.99', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18, color: Colors.black),),
                const Spacer(),
                MaterialButton(
                  height: 45.67,
                  minWidth: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)
                  ),
                  padding: const EdgeInsets.only(left: 12, right: 12,),
                  color: defaultColor,
                  onPressed: (){},
                  child: const Icon(IconlyBroken.plus,color: Colors.white,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}