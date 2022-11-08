import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/shared/components/components.dart';
import '../../models/Product_Model/product_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icons.dart';

class ShopItemCard extends StatelessWidget {
  final ProductModel model;
  final void Function()? onTap;
  const ShopItemCard({Key? key, required this.model, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
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
            CachedNetworkImage(
              imageUrl: model.image![0],
              errorWidget: (context, url, error) => Center(
                child: SvgPicture.asset(
                    height: MediaQuery.of(context).size.height*0.16,
                    width: double.infinity,
                    'assets/images/OrangeLogo.svg'),
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.height*0.16,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                  )
                ),
              ),
              placeholder: (context, url) => Container(
                height: MediaQuery.of(context).size.height*0.16,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: circularProIndicator(),
              ),
            ),
            const Spacer(),
            Text(model.name!,
              style: const TextStyle(fontSize: 16,
                  fontFamily: 'GilroyRegular',
                  fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text(model.quantity!, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: defaultGreyColor, fontSize: 14),),
            const SizedBox(height: 10,),
            Row(
              children:
              [
                Text('\$${model.price}', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18, color: Colors.black),),
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