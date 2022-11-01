import 'package:flutter/material.dart';
import 'package:online_groceries_app/modules/Shop_Screen/shop_item_card.dart';
import '../../shared/components/consts.dart';
import '../../shared/styles/icons.dart';
import 'item_details.dart';

class CategoriesScreen extends StatelessWidget {
  final String? appBarName;
  final List list;
  const CategoriesScreen({Key? key, required this.appBarName, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(appBarName!, style: const TextStyle(fontSize: 20,color: Colors.black, fontFamily: 'GilroyBold'),),
        leading: MaterialButton(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            shape: const CircleBorder(),
            minWidth: 1,
            padding: const EdgeInsets.all(15),
            child: const Icon(
              IconlyBroken.arrow_left_2,
              size: 30,
            )),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => ShopItemCard(model: list[index], onTap: (){pushReplacementNavigate(context, const ItemDetails());},)),
    );
  }
}
