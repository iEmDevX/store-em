import 'package:flutter/material.dart';

class ShoppingTypeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 5),
          Row(
            children: shoppingTypeList.map((ShoppingTypeData item) {
              return ShoppingType(item);
            }).toList(),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}

class ShoppingType extends StatelessWidget {
  final ShoppingTypeData data;
  ShoppingType(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    // image: NetworkImage(data.imgPath),
                    image: AssetImage('assets/images/shopping_type/elec.png')),
              ),
            ),
            Text(data.text),
          ],
        ),
      ),
    );
  }
}

class ShoppingTypeData {
  String text;
  String imgPath;

  ShoppingTypeData({@required this.text, @required this.imgPath});
}

List<ShoppingTypeData> shoppingTypeList = <ShoppingTypeData>[
  ShoppingTypeData(
    text: "Electronics",
    imgPath: "https://image.flaticon.com/icons/svg/1836/1836313.svg",
  ),
  ShoppingTypeData(
    text: "Fashions",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
  ShoppingTypeData(
    text: "Toys",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
  ShoppingTypeData(
    text: "Foods",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
  ShoppingTypeData(
    text: "Sports",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
  ShoppingTypeData(
    text: "Cars",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
  ShoppingTypeData(
    text: "Books",
    imgPath: "https://i.imgur.com/BoN9kdC.png",
  ),
];
