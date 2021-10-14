import 'package:dro_health/Utilities/item_list.dart';
import 'package:dro_health/Widgets/category_screen_widget.dart';
import 'package:dro_health/Widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends StatelessWidget {


  final ItemList _itemList = ItemList();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: HeaderWidget(headerText: "CATEGORIES",),
            ),
            Expanded(
              flex: 14,
              child: GridView.count
                (crossAxisCount: 2,
              shrinkWrap: true,
              children: List.generate(_itemList.categoryList.length, (index){
                return CategoryScreenWidget(imgPath: _itemList.categoryList[index].imagePath,
                categoryName: _itemList.categoryList[index].categoryName,);
              }),),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {

  double screenHeight;
  String headerText;

  HeaderWidget({this.headerText});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    return Column(
      children: [
        Container(
          height: screenHeight * 0.12,
          width: double.infinity,
          decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              image: DecorationImage(
                image: Image.asset("Images/my_design3.png").image,
                fit: BoxFit.cover
            ),
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
                  children: [
                    Expanded(
                      flex: 11,
                      child: Text(headerText,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                   const Expanded(
                      flex: 2,
                      child:  FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,size: 25,),
                    ) ],
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
               ],
            ),
          ),   ),
        SizedBox(height: screenHeight * 0.02,),
      ],
    );
  }
}
