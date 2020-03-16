import 'package:flutter/material.dart';
import 'package:store_test/project/commons/service/go_location_service.dart';
import 'package:store_test/project/page/home_page/widget/highlight/highlight_ui.dart';
import 'package:store_test/project/page/home_page/widget/highlight_slide/highlight_slide_ui.dart';
import 'package:store_test/project/page/home_page/widget/higthlight_vertical/higthlight_vertical_ui.dart';
import 'package:store_test/project/page/home_page/widget/search/search_page.dart';
import 'package:store_test/project/page/home_page/widget/shopping_type/shoping_type_ui.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.blur_on, color: Colors.blue),
            SizedBox(width: 3),
            Text(
              'STORE TEST',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            iconSize: 20,
            onPressed: () {
              Navigator.push(context, ScaleRoute(page: SearchPage()));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          ShoppingTypeUI(),
          HighlightUI(),
          HighlightSlide(),
          HighlightSlide(),
          HigthlightVerticalUI(),
        ],
      ),
    );
  }
}
