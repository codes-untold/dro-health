import 'package:dro_health/Screens/product_information.dart';
import 'package:dro_health/Utilities/item_list.dart';
import 'package:dro_health/Utilities/product_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {



  int totalItems;
  int index;
  List <ProductData> productDataList;

  // ignore: use_key_in_widget_constructors
  ProductWidget({
    this.index,
    this.totalItems,
    this.productDataList
});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {

  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child:widget.index + 1 < widget.totalItems?  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProductCard(index: widget.index, productDataList: widget.productDataList,),
          ProductCard(index: widget.index + 1,productDataList: widget.productDataList,),
        ],
      ):  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 16),
              child: ProductCard(index: widget.index , productDataList: widget.productDataList,)),
        ],
      )
    );
  }


}

class ProductCard extends StatelessWidget {

  double screenWidth = 0;
  double screenHeight = 0;


  ItemList itemList;
  int index;
  List <ProductData> productDataList;

  ProductCard({
    this.itemList,
    this.index,
    this.productDataList
});


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ()async{
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return ProductInformation(productData: productDataList[index],);
        }));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width:  screenWidth * 0.45,
            height: screenHeight * 0.3
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft:Radius.circular(16),topRight: Radius.circular(16) ),
                    child: Image.asset(productDataList[index].imgPath,fit: BoxFit.cover,),),
              ),
            Flexible(
              flex: 2,
              child: Padding(
                padding:const EdgeInsets.only(left: 10,right: 10,top : 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(productDataList[index].productName,style: const TextStyle(
                      fontFamily: "ProximaNova",
                   ),),
                   const  SizedBox(height: 2,),
                    Row(
                      children: [
                         Text(productDataList[index].isTablet?"Tablet":"Syrup",
                          style: const TextStyle(
                            fontSize: 12, color: Colors.grey ),),
                        const SizedBox(width: 4,),
                        const CircleAvatar(backgroundColor: Colors.grey,radius: 1,),
                        const SizedBox(width: 4,),
                       Text(productDataList[index].productWeight,  style: const  TextStyle(
                            fontSize: 12, color: Colors.grey ),)
                      ],
                    ),
                    const  SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Image.asset("Images/currency.png",width: 18,height: 18,),
                         Text("${productDataList[index].productPrice.toString()}.00",style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),)
                    ],)
                  ],
                ),
              ),
            )],
          ),
        ),
      ),
    );
  }
}
