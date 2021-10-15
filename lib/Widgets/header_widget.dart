import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWidget extends StatelessWidget {

  double screenHeight;
  String headerText;

  HeaderWidget({this.headerText});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
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
                      child: FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,)
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
