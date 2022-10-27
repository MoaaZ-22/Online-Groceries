import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'explore_item_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Find Products', style: TextStyle(fontSize: 20,color: Colors.black, fontFamily: 'GilroyBold'),),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll){
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15,top: 5),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 51,
                decoration: BoxDecoration(
                    color: searchBackgroundColor,
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorHeight: 20,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Search Store',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'GilroyRegular',
                      fontWeight: FontWeight.w600
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 0.84,
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(10,
                        (index) {
                  return  ExploreItemCard(index: index,);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

