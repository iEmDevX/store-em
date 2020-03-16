import 'package:flutter/material.dart';
import 'package:store_test/project/page/bottom_bar/bottombar_menu.dart';
import 'package:store_test/project/page/bottom_bar/bottombar_wg.dart';
import 'package:store_test/project/page/delivery_page/delivery_page.dart';
import 'package:store_test/project/page/home_page/home_page.dart';
import 'package:store_test/project/page/setting/setting_list_wg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(key: PageStorageKey('Page1')),
    DeliveryPage(key: PageStorageKey('Page2')),
    ListPage(key: PageStorageKey('Page3')),
    SettingListWg(key: PageStorageKey('Page4')),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        items: listMenu,
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];

    return SizedBox.expand(
      child: ListView.builder(
        itemCount: shades.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 128,
            child: Card(
              color: Colors.blue[shades[index]].withOpacity(0.25),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text('Item $index',
                      style: Theme.of(context).primaryTextTheme.display1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
