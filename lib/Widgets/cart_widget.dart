import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartWidget extends StatelessWidget {

  static const menuItems = <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

  final List <PopupMenuItem<int>> popDownMenuItems
  = menuItems.map((value) => PopupMenuItem<int >(
      value: value,
      child: Text(value.toString()))).toList();

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Image.asset("Images/zinc.jpg",width: 70,height: 70,fit: BoxFit.cover,),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text("Panadol",style: TextStyle(
                            ),),
                            const  SizedBox(height: 5,),
                            Row(
                              children: const [
                                Text("Tablet",
                                  style: TextStyle(
                                      fontSize: 12, color:Colors.black45 ),),
                                SizedBox(width: 4,),
                                CircleAvatar(backgroundColor: Colors.grey,radius: 1,),
                                SizedBox(width: 4,),
                                Text("500mg",  style: TextStyle(
                                    fontSize: 12, color: Colors.black45 ),)
                              ],
                            ),
                            const  SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset("Images/currency.png",width: 18,height: 18,),
                                const  Text("13500",style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),)
                              ],)
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 5,),
                            const Text("1", style: TextStyle(),),
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30
                              ),
                              child: PopupMenuButton<int>(
                                onSelected: (string){},
                                  itemBuilder: (BuildContext context) => popDownMenuItems ,
                                  icon:  const FaIcon(FontAwesomeIcons.arrowCircleDown,size: 10,color: Color(0xff9f5de2),)
                              ),
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          FaIcon(FontAwesomeIcons.trash,size: 12,color:  Color(0xff9f5de2),),
                          SizedBox(width: 5,),
                          Text("Remove",style: TextStyle(color:Color(0xff9f5de2)),)
                        ],
                      )  ],
                  ),],
              ),
            SizedBox(height: 10,),
            Divider()],
          );
  }
}
