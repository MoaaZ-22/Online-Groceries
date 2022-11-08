// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import 'package:rate/rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/Product_Model/product_model.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/styles/colors.dart';

class ItemDetails extends StatefulWidget {
  final ProductModel model;
  const ItemDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: ReusableTextButton(onPressed: (){},buttonText: 'Add To Basket',color: defaultColor,textColor: Colors.white,),
            ),
            backgroundColor: Colors.white,
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        decoration: const BoxDecoration(
                            color: Color(0xffF2F3F2),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        height: MediaQuery.of(context).size.height * 0.41,
                        child: ConditionalBuilder(
                          condition: widget.model.image != null,
                          builder: (context) => CarouselSlider.builder(
                              itemCount: widget.model.image!.length,
                              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex)
                              {
                                return CachedNetworkImage(
                                  imageUrl: widget.model.image[itemIndex],
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider
                                        )
                                    ),
                                  ),
                                  placeholder: (context , url) => circularProIndicator(),
                                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline, color: Colors.red,)),

                                );

                              },
                              options: CarouselOptions(
                                  onPageChanged: (index, c) {
                                    AppCubit.get(context)
                                        .changeDetailsSmoothPage(index);
                                  },
                                  height: 125,
                                  initialPage:
                                  AppCubit.get(context).detailsActiveIndex,
                                  pageSnapping: true,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  autoPlay: false,
                                  viewportFraction: 1.0,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal)),
                          fallback: (context) => circularProIndicator(),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        child: AnimatedSmoothIndicator(
                          activeIndex: AppCubit.get(context).activeIndex,
                          count: widget.model.image!.length,
                          effect: ExpandingDotsEffect(
                              dotHeight: 5,
                              dotColor: Colors.grey.shade400,
                              activeDotColor: defaultColor,
                              expansionFactor: 3,
                              dotWidth: 6,
                              spacing: 5),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.model.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontFamily: 'GilroyBold'),
                                ),
                                const Spacer(),
                                MaterialButton(
                                    onPressed: () {
                                    },
                                    minWidth: 0,
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      IconlyBroken.favourite,
                                      color: defaultGreyColor,
                                    ))
                              ],
                            ),
                            Text(
                              '1kg, Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: defaultGreyColor),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(quantity == 1)
                                      {
                                        quantity = 1;
                                      }
                                      else
                                      {
                                        quantity--;
                                      }
                                    });
                                  },
                                  radius: 10,

                                  child: Icon(
                                    IconlyBroken.minus__1_,
                                    size: 20,
                                    color: defaultGreyColor,
                                  ),
                                ),const SizedBox(width: 8,),
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 35.67,
                                  height: 35.67,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffE2E2E2), width: 1),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: Text(
                                    '$quantity',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(quantity == 20)
                                      {
                                        quantity = 20;
                                      }
                                      else
                                      {
                                        quantity++;
                                      }
                                    });
                                  },
                                  radius: 10,
                                  child: Icon(
                                    IconlyBroken.plus,
                                    size: 20,
                                    color: defaultColor,
                                  ),
                                ),
                                const Spacer(),
                                Text('\$${widget.model.price!}', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24, color: Colors.black, fontFamily: 'GilroyBold'),),
                                const SizedBox(width: 12,)
                              ],
                            ),
                            const SizedBox(height: 15,),
                            myDivider(),
                            ReusableExpansionTile(
                              title: 'Product Detail',
                              description: widget.model.productDetail,
                            ),
                            myDivider(),
                            ReusableExpansionTile(
                              title: 'Nutrition',
                              nutrition: '100Kg',
                            children: [
                              ReusableNutritionRow(text: 'Calories', details: widget.model.calories,),
                              const SizedBox(height: 5,),
                              ReusableNutritionRow(text: 'Fat', details: widget.model.fat,),
                              const SizedBox(height: 5,),
                              ReusableNutritionRow(text: 'Carbs', details: widget.model.carbs,),
                              const SizedBox(height: 5,),
                              ReusableNutritionRow(text: 'Protein', details: widget.model.protein,),
                            ]),
                            myDivider(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Row(
                                children: [
                                  Text('Review',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Rate(
                                    iconSize: 18,
                                    color: rateColor,
                                    initialValue: widget.model.review!.toDouble(),
                                    readOnly: true,
                                    onChange: (value) => print(value),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ]),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: 20,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            AppCubit.get(context)
                                .bottomNavigationBarCurrentIndex = 0;
                          },
                          shape: const CircleBorder(),
                          minWidth: 1,
                          padding: const EdgeInsets.all(15),
                          child: const Icon(
                            IconlyBroken.arrow_left_2,
                            size: 30,
                          )),
                      const Spacer(),
                      MaterialButton(
                          onPressed: () {},
                          shape: const CircleBorder(),
                          minWidth: 1,
                          padding: const EdgeInsets.all(15),
                          child: const Icon(
                            IconlyBroken.logout,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
