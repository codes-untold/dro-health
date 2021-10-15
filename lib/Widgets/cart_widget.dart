import 'package:dro_health/Bloc/my_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartWidget extends StatefulWidget {

  static const menuItems = <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

  Map<String,dynamic> map;
  int index;


  CartWidget({this.map,this.index});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final List <PopupMenuItem<int>> popDownMenuItems
  = CartWidget.menuItems.map((value) => PopupMenuItem<int >(
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
                        Image.asset(widget.map["ImgUrl"],width: 70,height: 70,fit: BoxFit.cover,),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(widget.map["productName"],style: const TextStyle(
                            ),),
                            const  SizedBox(height: 5,),
                            Row(
                              children:  [
                                const Text("Tablet",
                                  style: TextStyle(
                                      fontSize: 12, color:Colors.black45 ),),
                                const SizedBox(width: 4,),
                                const CircleAvatar(backgroundColor: Colors.grey,radius: 1,),
                                const  SizedBox(width: 4,),
                                Text(widget.map["productWeight"],  style: const TextStyle(
                                    fontSize: 12, color: Colors.black45 ),)
                              ],
                            ),
                            const  SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset("Images/currency.png",width: 18,height: 18,),
                                Text(widget.map["productPrice"].toString(),style: const TextStyle(
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
                            Text(widget.map["productCount"].toString(), style:const  TextStyle(),),
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30
                              ),
                        child: PopupMenuButton<int>(
                          onSelected: (number){
                            Map<String,dynamic> map = {
                              "productName": widget.map["productName"],
                              "productCount": number,
                              "productPrice": (widget.map["productPrice"]/widget.map["productCount"]) * number ,
                              "ImgUrl": widget.map["ImgUrl"],
                              "productWeight": widget.map["productWeight"],

                            };
                                  BlocProvider.of<ProductBloc>(context).updateProduct(widget.index, map);
                                  Navigator.popAndPushNamed(context, "/CartScreen");
                                },
                                  itemBuilder: (BuildContext context) => popDownMenuItems ,
                                  icon:  const FaIcon(FontAwesomeIcons.arrowCircleDown,size: 10,color: Color(0xff9f5de2),)
                              ),
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<ProductBloc>(context).deleteProduct(widget.index);
                          Navigator.popAndPushNamed(context, "/CartScreen");
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                            FaIcon(FontAwesomeIcons.trash,size: 12,color:  Color(0xff9f5de2),),
                            SizedBox(width: 5,),
                            Text("Remove",style: TextStyle(color:Color(0xff9f5de2)),)
                          ],
                        ),
                      )  ],
                  ),],
              ),
            SizedBox(height: 10,),
            Divider()],
          );
  }
}
