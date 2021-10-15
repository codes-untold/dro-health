import 'package:dro_health/Utilities/item_list.dart';
import 'package:dro_health/Widgets/category_screen_widget.dart';
import 'package:dro_health/Widgets/header_widget.dart';
import 'package:flutter/material.dart';


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


