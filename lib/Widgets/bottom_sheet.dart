import 'package:dro_health/Screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartBottomSheet extends StatelessWidget {

  String productName;
  CartBottomSheet({this.productName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(child: Text("$productName has been successfully added to cart!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,

              ),))),

          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CartScreen();
                  }));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                          colors:  [Color(0xff7a08fa),Color(0xffad3bfc)]
                      )
                  ),
                  child: const Center(
                    child: Text("VIEW CART",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),

                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: const Center(
                    child:  Text("CONTINUE SHOPPING",style: TextStyle(
                        color: Color(0xff9f5de2),
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9f5de2)
                    ),


                  ),
                ),
              ),
            ],
          )
      ]),
      padding: EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40),
            topLeft: Radius.circular(40))
      ),
    );
  }
}
