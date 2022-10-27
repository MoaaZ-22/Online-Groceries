// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/shared/cubit/states.dart';
import 'package:online_groceries_app/shared/styles/icons.dart';
import 'package:rate/rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/styles/colors.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
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
                        child: CarouselSlider(
                            items: AppCubit.get(context).detailsWidget,
                            options: CarouselOptions(
                                onPageChanged: (index, c) {
                                  AppCubit.get(context)
                                      .changeDetailsSmoothPage(index);
                                },
                                height: 125,
                                initialPage:
                                    AppCubit.get(context).detailsActiveIndex,
                                pageSnapping: true,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                viewportFraction: 1.0,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 1),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                scrollDirection: Axis.horizontal)),
                      ),
                      Positioned(
                        bottom: 25,
                        child: AnimatedSmoothIndicator(
                          activeIndex: AppCubit.get(context).activeIndex,
                          count: AppCubit.get(context).sliderWidget.length,
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
                      child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 15),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Naturel Red Apple',
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
                                onTap: (){},
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
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              InkWell(
                                onTap: (){},
                                radius: 10,
                                child: Icon(
                                  IconlyBroken.plus,
                                  size: 20,
                                  color: defaultColor,
                                ),
                              ),
                              const Spacer(),
                              Text('\$4.99', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 24, color: Colors.black, fontFamily: 'GilroyBold'),),
                              const SizedBox(width: 12,)
                            ],
                          ),
                          const SizedBox(height: 15,),
                          myDivider(),
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              childrenPadding: const EdgeInsets.only(bottom: 10),
                              tilePadding: EdgeInsets.zero,
                              title: Text('Product Detail',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                              ),
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              children: const [
                                Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healthful and varied diet.',
                                style:  TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'GilroyMedium'),
                                )
                              ],
                            ),
                          ),
                          myDivider(),
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              childrenPadding: const EdgeInsets.only(bottom: 10),
                              tilePadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  Text('Nutrition\'s',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffEBEBEB),
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text('100gr', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 9,color: const Color(0xff7C7C7C)),))
                                ],
                              ),
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              children: const [
                                Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healthful and varied diet.',
                                  style:  TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'GilroyMedium'),
                                )
                              ],
                            ),
                          ),
                          myDivider(),
                          Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              childrenPadding: const EdgeInsets.only(bottom: 10),
                              tilePadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  Text('Review',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Rate(
                                    iconSize: 18,
                                    color: rateColor,
                                    initialValue: 3.5,
                                    readOnly: false,
                                    onChange: (value) => print(value),
                                  ),
                                ],
                              ),
                              iconColor: Colors.black,
                              collapsedIconColor: Colors.black,
                              children: const [
                                Text('Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healthful and varied diet.',
                                  style:  TextStyle(fontSize: 13, color: Colors.grey, fontFamily: 'GilroyMedium'),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                          ReusableTextButton(onPressed: (){},buttonText: 'Add To Basket',color: defaultColor,textColor: Colors.white,)
                        ],
                      ),
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
