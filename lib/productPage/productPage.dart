//dart import
import 'package:flutter/material.dart';
//local import
import 'package:playstationapp/productPage/background.dart';
import 'package:playstationapp/productPage/appbar.dart';
import 'package:playstationapp/productPage/product.dart';
import 'package:playstationapp/productPage/infomation.dart';
import 'package:playstationapp/productPage/features.dart';
import 'package:playstationapp/productPage/priceTage.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic>? data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //---------background---------
          BackGround(
            width: width,
            height: height,
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  flex: 1,
                  child: Appbar(),
                ),
                Expanded(
                  flex: 7,
                  child: Product(
                    img: data?["img"],
                    releaseDate: data?["releaseDate"],
                    price: data?["price"],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: <Widget>[
                      Expanded(flex: 5, child: Info()),
                      Expanded(flex: 8, child: Features())
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PriceTage(price: data?["price"]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
