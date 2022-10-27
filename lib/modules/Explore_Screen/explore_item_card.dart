import 'package:flutter/material.dart';
import '../../shared/cubit/cubit.dart';

class ExploreItemCard extends StatelessWidget {
  final int index;
  const ExploreItemCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.5,
      height: 189.11,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppCubit.get(context).exploreColors[index % AppCubit.get(context).exploreColors.length],
          border: Border.all(
            color: AppCubit.get(context).borderColors[index % AppCubit.get(context).borderColors.length],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(18)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Image.asset(
              height: MediaQuery.of(context).size.height*0.16,
              width: double.infinity,
              alignment: AlignmentDirectional.center,'assets/images/beef.png'),
          const Spacer(),
          const Text('Fresh Fruits & Vegetable',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16,
                fontFamily: 'GilroyBold', color: Colors.black),),
        ],
      ),
    );
  }
}