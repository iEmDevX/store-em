import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/images/bottombar_icon/arrow-left.svg',
                    color: Colors.white,
                    height: 23,
                    width: 23,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding: EdgeInsets.only(top: 3, bottom: 3),
                child: Card(
                  child: ListTile(
                    title: TextField(
                      controller: controllerSearch,
                      // decoration: InputDecoration(
                      //   hintText: 'Search',
                      //   border: InputBorder.none,
                      // ),
                      // onChanged: onSearchTextChanged,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.cancel,
                      ),
                      onPressed: () {
                        controllerSearch.clear();
                        // onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
