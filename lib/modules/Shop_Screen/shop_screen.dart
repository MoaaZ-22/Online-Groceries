// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_groceries_app/modules/Shop_Screen/categories_item_card.dart';
import 'package:online_groceries_app/modules/Shop_Screen/categories_screen.dart';
import 'package:online_groceries_app/modules/Shop_Screen/see_all_screen.dart';
import 'package:online_groceries_app/modules/Shop_Screen/shop_item_card.dart';
import 'package:online_groceries_app/shared/cubit/cubit.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import 'item_details.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context,state){},
        builder: (context, state){
          List exclusiveOffer = AppCubit.get(context).exclusiveOffer;
          List bestSelling = AppCubit.get(context).bestSelling;
          List all = AppCubit.get(context).all;
          List pulses = AppCubit.get(context).pulses;
          List rice = AppCubit.get(context).rice;
          return ConditionalBuilder(
              condition: state is! GetExclusiveProductSuccessState || state is! GetBestSellingProductSuccessState || state is! GetAllProductSuccessState,
              builder: (context){
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 15),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                        child: Column(
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
                                onPressed: () {},
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
                            const SizedBox(height: 10,),
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CarouselSlider(
                                      items: AppCubit.get(context).sliderWidget,
                                      options: CarouselOptions(
                                          onPageChanged: (index,c)
                                          {
                                            AppCubit.get(context).changeSmoothPage(index);
                                          },
                                          height: 125,
                                          initialPage: AppCubit.get(context).activeIndex,
                                          pageSnapping: true,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: false,
                                          viewportFraction: 1.0,
                                          autoPlayInterval: const Duration(seconds: 3),
                                          autoPlayAnimationDuration: const Duration(seconds: 1),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          scrollDirection: Axis.horizontal)),
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: AppCubit.get(context).activeIndex,
                                    count: AppCubit.get(context).sliderWidget.length,
                                    effect: ExpandingDotsEffect(
                                        dotHeight: 8,
                                        dotColor: Colors.grey.shade400,
                                        activeDotColor: defaultColor,
                                        expansionFactor: 3,
                                        dotWidth: 8,
                                        spacing: 5
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30,),
                            ReusableHomeRowText(text: 'Exclusive Offer',seeAllFunction: ()
                            {
                              navigateWithAnimation(context, SeeAllScreen(appBarName: 'Exclusive Products', list: exclusiveOffer), AxisDirection.up);
                            }
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 13,),
                      SizedBox(
                        height: 248.51,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(left: 16, right: 10),
                          separatorBuilder: (context, index) => const SizedBox(width: 15.2,),
                          itemBuilder: (context, index)
                          {
                            return ShopItemCard(model: exclusiveOffer[index], onTap: (){navigateTo(context, const ItemDetails());},);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: exclusiveOffer.length,),
                      ),
                      const SizedBox(height: 16,),
                      ReusableHomeRowText(text: 'Best Selling', seeAllFunction:  (){
                        navigateWithAnimation(context, SeeAllScreen(appBarName: 'Best Selling Products', list: bestSelling), AxisDirection.up);
                      },leftPadding: 15,rightPadding: 15,),
                      const SizedBox(height: 13,),
                      SizedBox(
                        height: 248.51,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(left: 16, right: 10),
                          separatorBuilder: (context, index) => const SizedBox(width: 15.2,),
                          itemBuilder: (context, index)
                          {
                            return ShopItemCard(model: bestSelling[index], onTap: (){navigateTo(context, const ItemDetails());});
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: bestSelling.length,),
                      ),
                      const SizedBox(height: 16,),
                      // ToDO: See All For Groceries Types
                      ReusableHomeRowText(text: 'Groceries', seeAllFunction:  (){},leftPadding: 15,rightPadding: 15,),
                      SizedBox(
                        height: 105,
                        child: NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (overScroll){
                            overScroll.disallowIndicator();
                            return true;
                          },
                          child: ListView(
                              padding: const EdgeInsets.only(left: 15,right: 10),
                              scrollDirection: Axis.horizontal,
                              children: [
                                ReusableCategoriesItemCard(image: 'assets/images/pulses.png', name: 'Pulses',
                                  onTap: ()
                                  {
                                  navigateTo(context, CategoriesScreen(appBarName: 'Pulses Products', list: pulses));
                                  },),
                                const SizedBox(width: 5,),
                                ReusableCategoriesItemCard(image: 'assets/images/rice.png', name: 'Rice',
                                  onTap: ()
                                  {
                                    navigateTo(context, CategoriesScreen(appBarName: 'Rice Products', list: rice));
                                  },),
                              ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 248.51,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(left: 16, right: 10),
                          separatorBuilder: (context, index) => const SizedBox(width: 15.2,),
                          itemBuilder: (context, index)
                          {
                            return ShopItemCard(model: all[index], onTap: (){navigateTo(context, const ItemDetails());});
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: all.length,),
                      ),
                    ],
                  ),
                );
              },
              fallback: (context)
              {
                return circularProIndicator();
              }
          );
        }
    );
  }
}
