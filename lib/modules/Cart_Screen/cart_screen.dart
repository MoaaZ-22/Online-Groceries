import 'package:flutter/material.dart';
import 'package:online_groceries_app/modules/Cart_Screen/order_success_screen.dart';
import 'package:online_groceries_app/shared/components/components.dart';
import 'package:online_groceries_app/shared/components/consts.dart';
import 'package:online_groceries_app/shared/styles/colors.dart';
import 'cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            ReusableTextButton(buttonText: 'Check Out', onPressed: ()
            {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                  backgroundColor: Colors.white,
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*0.6,
                      child: Column(
                        children:
                        [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                const Text('Checkout', style: TextStyle(fontSize: 24,color: Colors.black),),
                                const Spacer(),
                                InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    radius: 60,
                                    onTap:(){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: defaultGreyColor,
                                    )),
                              ],
                            ),
                          ),
                          myDivider(),
                          ReusableShowModalBottomSheet(text: 'Delivery',onPressed: (){}, widget: Text('Select Method', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black, fontSize: 16,),),),
                          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                            child: myDivider(),
                          ),
                          ReusableShowModalBottomSheet(text: 'Payment',onPressed: (){}, widget: const Icon(Icons.credit_card_rounded, color: Colors.teal,),),
                          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                            child: myDivider(),
                          ),
                          ReusableShowModalBottomSheet(text: 'Promo Code',onPressed: (){}, widget: Text('Pick discount', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black, fontSize: 16,),),),
                          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                            child: myDivider(),
                          ),
                          ReusableShowModalBottomSheet(text: 'Total Cost',onPressed: (){}, widget: Text('\$13.3', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black, fontSize: 16,),),),
                          Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                            child: myDivider(),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 13.5,
                                    fontFamily:'GilroyMedium',
                                    height: 1.5
                                ),
                                children: <TextSpan>[
                                   TextSpan(text: 'By placing an order you agree to our ',style: TextStyle(color: defaultGreyColor)),
                                  const TextSpan(text: 'Terms  ', style: TextStyle(color: Colors.black,)),
                                   TextSpan(text: 'and ', style: TextStyle(color: defaultGreyColor,)),
                                  const TextSpan(text: 'Conditions.', style: TextStyle(color:Colors.black,)),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10),
                            child: ReusableTextButton(color: defaultColor, textColor: Colors.white,buttonText: 'Place Order',onPressed:
                                ()
                            {

                              pushReplacementNavigate(context, const OrderSuccess());
                            },),
                          )
                        ],
                      ),
                    );
                  }
              );
            }
              , color: defaultColor,textColor: Colors.white,),
            Positioned(
              right: 25,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xff489E67),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Text('\$13.9', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white, fontSize: 14),)
                ,),
            )
          ],),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: reusableAppBar(appBarText: 'My Cart', centerTitle: true, toolbarHeight: 70),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.11),
          itemBuilder: (context, index)
          {
            return const CartItemCard();
          },
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(11),
            child: myDivider(),
          ),
          itemCount: 10
      ),
    );
  }
}
