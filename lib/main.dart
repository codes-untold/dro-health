import 'package:dro_health/Bloc/my_bloc.dart';
import 'package:dro_health/Screens/cart_screen.dart';
import 'package:dro_health/Screens/pharmacy_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/category_screen.dart';
import 'Widgets/category_widget.dart';

void main() {
  runApp(BlocProvider<ProductBloc>(
    create: (BuildContext context)=> ProductBloc([]),
    child: MaterialApp(
      routes: {
        "/CartScreen":(context) => CartScreen()
      },
      home:  PharmacyScreen()
    ),
  ));
}



