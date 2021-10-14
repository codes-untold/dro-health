import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreenWidget extends StatelessWidget {
  double screenWidth;
  double screenHeight;

  String imgPath;
  String categoryName;

  CategoryScreenWidget({this.categoryName,this.imgPath});
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
      child: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                    image: Image.asset(imgPath).image,
                    fit: BoxFit.cover
                )
            ),
          ),

          Container(
           // height: screenWidth * 0.1,
            child: Center(
              child: Text(categoryName,style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.black54
            ),
          ),
        ],

      ),
    );
  }
}
