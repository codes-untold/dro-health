import 'package:dro_health/Bloc/my_bloc.dart';
import 'package:dro_health/Screens/cart_screen.dart';
import 'package:dro_health/Screens/category_screen.dart';
import 'package:dro_health/Utilities/item_list.dart';
import 'package:dro_health/Utilities/product_data.dart';
import 'package:dro_health/Widgets/category_widget.dart';
import 'package:dro_health/Widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class PharmacyScreen extends StatefulWidget {
  @override
  _PharmacyScreenState createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {

  double screenHeight;
  double screenWidth;
  List <Widget> list = [];
  List <Widget> searchList = [];

  final ItemList _itemList = ItemList();
  final List <ProductData> productDataList = [];
  bool isvisible = true;

  @override
  void initState() {
    super.initState();

    for(int i = 0;i < _itemList.productList.length;i+=2){
     list.add(ProductWidget(productDataList: _itemList.productList,index: i,totalItems: _itemList.productList.length,));
    }
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: screenHeight * 0.25,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.18,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset("Images/my_design3.png").image,
                        fit: BoxFit.cover
                ),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      ),
             child: Padding(
               padding: EdgeInsets.only(
                       right: 16,
                       bottom: 16,
                       left: 16,
                       top: screenHeight * 0.04,
               ),
       child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
                   children:  [
                    const Expanded(
                       flex: 11,
                       child: Text("Pharmacy",style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),),
                     ),
                     Expanded(
                       flex: 3,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Image.asset("Icons/favourite.png",width: 25,height: 25,),
                           SizedBox(width: 5,),
                           Image.asset("Icons/deliveryVan.png",width: 25,height: 25,),
                         ],
                       ),
                     ) ],
                 ),
                 SizedBox(
                    height: screenHeight * 0.015,
                  ),
               ConstrainedBox(
                 constraints: const BoxConstraints.tightFor(
                   height: 40
                 ),
                 child: TextField(
                   style: TextStyle(color: Colors.white),
                   onChanged: (value){
                     if(value.isNotEmpty){
                       setState(() {
                         isvisible = false;

                        productDataList.clear();
                        searchList.clear();
                         for(int i = 0; i < _itemList.productList.length;i++){
                           if(_itemList.productList[i].productName.contains(value)){

                             productDataList.add(_itemList.productList[i]);
                           }
                         }

                         for(int i = 0;i < productDataList.length ;i+=2){

                           searchList.add(ProductWidget(productDataList: productDataList,
                             index: i,totalItems: productDataList.length,));
                         }








                       });
                     }else{
                       setState(() {
                         isvisible = true;
                         productDataList.clear();
                         searchList.clear();
                       });
                     }
                   },
                   decoration: const InputDecoration(
                   prefixIcon:  Padding(
                     padding: EdgeInsets.only(top: 10.5,left: 12.0),
                     child: FaIcon(FontAwesomeIcons.search,color: Colors.white,size: 15,),
                   ),
                     filled: true,
                   fillColor: Colors.white12,
                   hintStyle: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                   ),
                     hintText: "Search",
                     contentPadding: EdgeInsets.only(left: 30),
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         borderSide: BorderSide.none
                     )
                 ),
                 ),
               )],
       ),
     ),   ),
                 SizedBox(height: screenHeight * 0.02,),
                 Padding(
                   padding: const EdgeInsets.only(left: 16),
                   child: Row(
                     children: const [
                        FaIcon(FontAwesomeIcons.locationArrow,color: Colors.black,size: 15,),
                       SizedBox(width: 10,),
                       Text("Delivery in "),
                      Text("Lagos, NG",
                       style: TextStyle(
                         fontWeight: FontWeight.w800,
                         fontSize: 15
                       ),),
                     ],
                   ),
                 ) ],
                ),
              ),
            ),
         Expanded(
           flex: 6,
           child: ListView(
             shrinkWrap: true,
               children: [
                 Visibility(
                   visible: isvisible,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Text("CATEGORIES",style: TextStyle(
                             fontWeight: FontWeight.w900,
                             color: Colors.grey
                         ),),
                         TextButton(onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return CategoryScreen();
                           }));
                         }, child: const Text("VIEW ALL",style: TextStyle(
                             color: Color(0xff9f5de2)
                         ),))
                       ],
                     ),
                   ),
                 ),
                 const SizedBox(height: 10,),

                 Visibility(
                   visible: isvisible,
                   child: Container(
                     width: screenWidth,
                     height: screenHeight * 0.12,
                     child: ListView.builder(itemBuilder: (context,i){
                       return CategoryWidget(
                         imgPath: _itemList.categoryList[i].imagePath,
                         categoryName: _itemList.categoryList[i].categoryName,
                       );
                     },
                       itemCount: _itemList.categoryList.length,
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                     ),
                   ),
                 ),
                 const SizedBox(height: 20,),
                 Visibility(
                   visible: isvisible,
                   child: const Padding(
                     padding:  EdgeInsets.only(left: 16.0,right: 16.0),
                     child:  Text("SUGGESTIONS",style: TextStyle(
                         color: Colors.grey,
                         fontWeight: FontWeight.bold
                     ),),
                   ),
                 ),
                 const SizedBox(height: 15,),

                 Container(
                   width: double.infinity,
                   child: Column(
                     children: isvisible?list:searchList,
                   ),
                 )
               ],
             ),
         ) ],
        ),
      ),
    floatingActionButton:BlocBuilder<ProductBloc,List<Map<String,dynamic>>>(
      bloc: BlocProvider.of<ProductBloc>(context),
        builder: (BuildContext context,List<Map<String,dynamic>> state){
          return   GestureDetector(
            onTap: (){

            },
            child: Container(
              width: 130,
              height: 38,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [Color(0xfffe806f),Color(0xffe5366a)]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text("Checkout",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                  const  SizedBox(width: 3,),
                  const  FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,size: 17,),
                  const  SizedBox(width: 2,),
                  CircleAvatar(backgroundColor: Colors.amber,child: Text(state.length.toString(),style:const  TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.bold
                  ),),radius: 8,)
                ],
              ),
            ),
          );
        }

    ),);
  }
}
