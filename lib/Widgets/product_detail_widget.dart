
import 'package:dro_health/Widgets/product_widget.dart';
import 'package:flutter/material.dart';
class DetailWidget extends StatelessWidget {

  String imagePath;
  String textOne;
  String textTwo;

  DetailWidget({this.imagePath,this.textOne,this.textTwo});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath,
          width: 25,),
        const SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textOne,style: const TextStyle(
                color: Colors.grey,
                fontSize: 10
            ),),
            Text(textTwo,style: TextStyle(
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.w500,
                fontSize: 12
            ),),
],
        ),
      ],
    );
  }
}
