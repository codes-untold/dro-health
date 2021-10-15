import 'package:dro_health/Bloc/my_bloc.dart';
import 'package:dro_health/Screens/category_screen.dart';
import 'package:dro_health/Utilities/item_list.dart';
import 'package:dro_health/Utilities/product_data.dart';
import 'package:dro_health/Widgets/bottom_sheet.dart';
import 'package:dro_health/Widgets/product_detail_widget.dart';
import 'package:dro_health/Widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart_screen.dart';

class ProductInformation extends StatefulWidget {

  ProductData productData;

  ProductInformation({this.productData});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  double screenHeight;

  double screenWidth;

  ItemList itemList = ItemList();

  int productCount = 1;
  int totalAmount;


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    totalAmount = widget.productData.productPrice * productCount;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: HeaderWidget(headerText: "Pharmacy",)),
              Expanded(
                flex: 11,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: CircleAvatar(
                          radius: 80,
                            backgroundImage: Image.asset(widget.productData.imgPath,width: screenWidth * 0.4,).image,
                            //child: Image.asset(productData.imgPath,width: screenWidth * 0.4,)
                        )),
                        SizedBox(height: screenHeight * 0.03,),
                         Center(
                         child: Text(widget.productData.productName,style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),),
                       ),
                        SizedBox(height: screenHeight * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.productData.isTablet?"Tablet":"Syrup",style: const TextStyle(
                                fontSize: 14,
                              color: Colors.grey
                            ),),
                            Text(" - "),
                            Text(widget.productData.productWeight,style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey
                            ),),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.05,),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    child: Text((widget.productData.productMerchant.substring(0,1)),style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    backgroundColor: Color(0xff9f5de2),
                                  ),
                                const SizedBox(width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const Text("Sold by",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13
                                  )
                                ),
                                    Text(widget.productData.productMerchant,style: TextStyle(
                                        color: Colors.blueGrey[600],
                                      fontWeight: FontWeight.bold
                                    )
                                    ), ],
                              ),

                      ],
                    ),
                            ), IconButton(onPressed: (){},
                                icon: Image.asset("Icons/heart.png",width: 20,) ),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 8,
                                      bottom: 8
                                    ),
                                    child: Row(
                                      children:  [
                                        GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                if(productCount == 1)return;
                                                productCount--;
                                              });
                                            },
                                            child: const FaIcon(FontAwesomeIcons.minus,size: 9,)),
                                        const SizedBox(width: 15,),
                                        Text(productCount.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.w800),),
                                        const SizedBox(width: 15,),
                                        GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                productCount++;
                                              });
                                            },
                                            child: const FaIcon(FontAwesomeIcons.plus,size: 9,)),

                                      ],
                                    ),
                                  ),
                                ),
                             const SizedBox(width: 10,),
                           const  Text("pack(s)",style: TextStyle(color: Colors.grey),) ],
                            ),
                          Row(children: [
                            Image.asset("Images/currency.png",width: 20,),
                            Text("${totalAmount.toString()}.00",
                              style: const  TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 20
                            ),)
                          ],)],
                        ),
                        const SizedBox(height: 22,),
                      Text("PRODUCT DETAILS",style: TextStyle(
                        color: Colors.blueGrey[500],
                        fontWeight: FontWeight.bold
                      ),),
                        const SizedBox(height: 15,),
                     Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             DetailWidget(
                               imagePath: "Images/capsules_logo.png",
                               textOne: "PACK SIZE",
                               textTwo: widget.productData.productDetail1,
                             ),
                             DetailWidget(
                               imagePath: "Images/qr-code.png",
                               textOne: "PRODUCT ID",
                               textTwo: widget.productData.productDetail2,
                             ),
                           ],
                         ),
                         const SizedBox(height: 15,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             DetailWidget(
                               imagePath: "Images/capsule_logo.png",
                               textOne: "CONSTITUENTS",
                               textTwo: widget.productData.productDetail3,
                             ),
                             DetailWidget(
                               imagePath: "Images/dispenser_logo.png",
                               textOne: "DISPENSED IN",
                               textTwo: widget.productData.productDetail4,
                             ),
                           ],
                         ),
                       ],
                     ),

                        const SizedBox(height: 25,),
                        Text(widget.productData.productDescription,style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                        ),),
                        const SizedBox(height: 35,),
                        const Text("Similar Products",style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),
                        const SizedBox(height: 10,),

                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.3,
                          child: ListView.builder(itemBuilder: (context,i){
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ProductCard(productDataList: itemList.productList,index: i,),
                            );
                          },
                            itemCount: itemList.productList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                          ),
                        ),
                      ],
          ),
      ),
                ),
    )]),
        )),
    floatingActionButton: GestureDetector(
      onTap: (){
        Map<String,dynamic> map = {
          "productName": widget.productData.productName,
          "productCount": productCount,
          "productPrice": totalAmount ,
          "ImgUrl": widget.productData.imgPath,
          "productWeight": widget.productData.productWeight,

        };

        BlocProvider.of<ProductBloc>(context).addProduct(map);

        print( BlocProvider.of<ProductBloc>(context).state);
        showModalBottomSheet(context: context, builder: (ctx){
         return CartBottomSheet(productName: widget.productData.productName,);
        },shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ));

      },
      child: Container(
        width: screenWidth * 0.9,
        height: 47,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
                colors:  [Color(0xff7a08fa),Color(0xffad3bfc)]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,size: 17,),
            SizedBox(width: 3,),
            Text("Add to Cart",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
);
  }

}

