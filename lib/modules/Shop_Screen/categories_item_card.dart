import 'package:flutter/material.dart';
import '../../shared/cubit/cubit.dart';

class ReusableCategoriesItemCard extends StatelessWidget {
  final void Function()? onTap;
  final String? image;
  final String? name;
  const ReusableCategoriesItemCard({Key? key, this.onTap, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 238.19,
        height: 105,
        decoration: BoxDecoration(
            color: AppCubit.get(context).colors[8 % AppCubit.get(context).colors.length],
            borderRadius: BorderRadius.circular(18)
        ),
        child: Row(
          children: [
            Image.asset(
                height: 71,width:71,fit: BoxFit.cover,
                image!),
            const SizedBox(width: 15,),
            Text(name!, style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
