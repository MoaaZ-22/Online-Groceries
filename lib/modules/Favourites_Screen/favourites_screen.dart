import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icons.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: ReusableTextButton(buttonText: 'Add All To Cart', onPressed: ()
        {
          dialogBox(context);
        }, color: defaultColor,textColor: Colors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: reusableAppBar(appBarText: 'Favorites', centerTitle: true, toolbarHeight: 70),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.11),
          itemBuilder: (context, index)
          {
            return  const FavouritesItemCard();
          },
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10
      ),

    );
  }
}

class FavouritesItemCard extends StatelessWidget {
  const FavouritesItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.156,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            fit: BoxFit.contain,
              height: double.infinity,
              width: 65,
              'assets/images/pngfuel 12.png'),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bell Pepper Red',
                style: TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'GilroyBold',),),
              Text('7pcs, Priceg', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: defaultGreyColor, fontSize: 14, fontFamily: 'GilroyMedium'),),
            ],
          ),
          const Spacer(),
          Text('\$1.50', style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),),
          const SizedBox(width: 10,),
          InkWell(
              borderRadius: BorderRadius.circular(30),
              radius: 35,
              onTap:(){},
              child: Icon(
                IconlyBroken.arrow_right_2,
                color: defaultGreyColor,
              )),
        ],
      ),
    );
  }
}
