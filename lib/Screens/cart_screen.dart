import 'package:dro_health/Bloc/my_bloc.dart';
import 'package:dro_health/Widgets/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double screenHeight;
  double screenWidth;


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
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
                            child: Row(
                              children: const[
                                FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.white,size: 25,),
                                SizedBox(width: 10,),
                                Text("Cart",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Image.asset("Icons/favourite.png",width: 20,height: 20,),
                          ) ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                    ],
                  ),
                ),   ),
            ),
            SizedBox(height: screenHeight * 0.02,),
            Expanded(
              flex: 17,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  BlocBuilder<ProductBloc,List<Map<String,dynamic>>>(
                    bloc: BlocProvider.of<ProductBloc>(context),
                     builder: (BuildContext context,List<Map<String,dynamic>> state){
                       return state.isNotEmpty? ListView.builder(itemBuilder: (BuildContext context,int i){
                         return CartWidget(
                           index: i,
                           map: state[i],
                         );
                       },
                         shrinkWrap: true,
                         itemCount: state.length,):Container();
                     }
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 24
                ),
                child: BlocBuilder<ProductBloc,List<Map<String,dynamic>>>(
                  bloc: BlocProvider.of<ProductBloc>(context,listen: false),
                  builder: (BuildContext context,List<Map<String,dynamic>> state){
                    return state.isNotEmpty?  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Total:"),
                            const  SizedBox(width: 10,),
                            Image.asset("Images/currency.png",width: 18,height: 18,),
                            Text("${totalCalculator(state)}",style: const  TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        Container(
                          width: screenWidth * 0.4,
                          height: 38,
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
                              Text("CheckOut",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),

                            ],
                          ),
                        ),
                      ],
                    ):Container();
                  },

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double totalCalculator(List<Map<String,dynamic>> list){
    double total = 0;
    for(int i = 0; i < list.length; i++){
      total+=list[i]["productPrice"];
    }
    return total;
  }
}
