

import 'package:dro_health/Utilities/category_data.dart';
import 'package:dro_health/Utilities/product_data.dart';

class ItemList{

  List <CategoryData> categoryList = [

    CategoryData(
      imagePath: "Images/analysis.jpg",
      categoryName: "Analysis"
    ),
    CategoryData(
        imagePath: "Images/antimalarial.jpg",
        categoryName: "Anti-malarial"
    ),
    CategoryData(
        imagePath: "Images/blood-pressure.jpg",
        categoryName: "Blood Pressure"
    ),
    CategoryData(
        imagePath: "Images/diabetes.jpg",
        categoryName: "Diabetes"
    ),
    CategoryData(
        imagePath: "Images/diagnosis.jpg",
        categoryName: "Diagnosis"
    ),
    CategoryData(
        imagePath: "Images/lab_tests.jpg",
        categoryName: "Lab Tests"
    ),
    CategoryData(
        imagePath: "Images/orthopedic.jpg",
        categoryName: "Orthopedic"
    ),
    CategoryData(
        imagePath: "Images/pharmacy.png",
        categoryName: "Pharmacy"
    ),
  ];


  List <ProductData> productList = [

    ProductData(
      imgPath: "Images/azithromycin.jpg",
      productName: "Azithromycin",
      productDescription: "1 pack of Azithromycin (250mg) contains 1 unit(s) of 6 Tablets",
      productMerchant: "Emzor Pharamaceuticals",
      isTablet: true,
      productWeight:"250mg",
      productPrice: 930,
      productDetail1: "1 x 6",
      productDetail2: "JUR78H4H7",
      productDetail3: "Azithromycin",
      productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/chloroquine.jpg",
        productName: "Chloroquine",
        productDescription: "1 pack of Chloroquine(100mg) contains 1 unit(s) of 1 oral suspension(s)",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: false,
        productWeight:"100mg",
        productPrice: 1970,
        productDetail1: "1 x 1",
        productDetail2: "U4HF7HR7457",
        productDetail3: "Certixime susp 100mg/5ml",
        productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/Emgyl.jpg",
        productName: "Emprofen Suspension",
        productDescription: "1 pack of Emprofen Suspension(100mg) contains 1 unit(s) of 1 100 oral suspension(s)",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: false,
        productWeight:"100mg",
        productPrice: 245,
        productDetail1: "1 x 100",
        productDetail2: "BHG474GV76T",
        productDetail3: "Ibuprofen",
        productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/folic_acid.jpg",
        productName: "Emtrim",
        productDescription: "1 pack of Emtrim(480mg) contains 10 unit(s) of 10 Tablets",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: true,
        productWeight:"480mg",
        productPrice: 660,
        productDetail1: "10 x 10",
        productDetail2: "GHDF7V8FD",
        productDetail3: "C0-Trimoxazole",
        productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/emzoron.jpg",
        productName: "Em-B-Plex",
        productDescription: "1 pack of Em-B-Plex contains 1 unit(s) of 1 units of syrup",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: false,
        productWeight:"100mg",
        productPrice: 1970,
        productDetail1: "1 x 1",
        productDetail2: "GF5GFR5FR",
        productDetail3: "Vitamin B Complex",
        productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/vitamins.jpg",
        productName: "Zolat Tablets",
        productDescription: "1 pack of Chloroquine(100mg) contains 1 unit(s) of 1 oral suspension(s)",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: false,
        productWeight:"100mg",
        productPrice: 1970,
        productDetail1: "1 x 20",
        productDetail2: "U4HF7HR7457",
        productDetail3: "Albendazole BP",
        productDetail4: "Units"

    ),

    ProductData(
        imgPath: "Images/Emgyl.jpg",
        productName: "Emgyl Blister",
        productDescription: "1 pack of Chloroquine(100mg) contains 1 unit(s) of 1 oral suspension(s)",
        productMerchant: "Emzor Pharamaceuticals",
        isTablet: true,
        productWeight:"200mg",
        productPrice: 340,
        productDetail1: "10 x 10",
        productDetail2: "JD74HGRER",
        productDetail3: "Metronidazole",
        productDetail4: "Units"

    ),
  ];
}