import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  double screenWidth;
  double screenHeight;

  String imgPath;
  String categoryName;

  CategoryWidget({
    this.imgPath,
    this.categoryName
});
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(right: 10,left: 10),
      child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: screenWidth * 0.3,
              height: screenWidth * 0.18,
            ),
            child: Stack(
              children: [
                Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          image: Image.asset(imgPath).image,
                          fit: BoxFit.cover
                      )
                  ),
                ),

                Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.18,
                  child: Center(
                    child: Text(
                      categoryName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "ProximaNova",
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
          ),
    );
  }
}
