import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_test/project/commons/constants/theme.dart';
import 'package:store_test/project/commons/i18n/keys.dart';
import 'package:store_test/project/commons/service/go_location_service.dart';
import 'package:store_test/project/commons/utils/theme.dart';
import 'package:store_test/project/page/setting/lang_setting/lang_setting_page.dart';
import 'package:xlive_switch/xlive_switch.dart';

class SettingListWg extends StatefulWidget {
  SettingListWg({Key key}) : super(key: key);
  @override
  _SettingListWgState createState() => _SettingListWgState();
}

class _SettingListWgState extends State<SettingListWg> {
  bool isSwitched = true;
  bool darkThemeOn = false;

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
      darkThemeOn = darkModeOn;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    darkThemeOn = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 150.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  "SETTING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/40465/pexels-photo-40465.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            TextHederListSetting('User Detail'),
            ListSetting(
              text: 'User Detail',
              icon: Icons.person,
              action: ForwardArrowSetting(),
            ),
            TextHederListSetting('General Setting'),
            ListSetting(
              text: 'Dark Theme',
              icon: Icons.brightness_4,
              action: XlivSwitch(
                value: darkThemeOn,
                onChanged: (value) {
                  setState(() {
                    darkThemeOn = value;
                  });
                  onThemeChanged(value, themeNotifier);
                },
              ),
            ),
            LineSetting(),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.blueGrey.shade700,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Notify',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: XlivSwitch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            LineSetting(),
            InkWell(
              onTap: () {
                GoLocationService.navigatorPush(
                  context,
                  LangSettingPage(),
                );
              },
              child: ListSetting(
                text: translate(Keys.Setting_Page_Languages_Setting_Title),
                icon: Icons.g_translate,
                action: ForwardArrowSetting(),
              ),
            ),
            LineSetting(),
            ListSetting(
              text: 'Info Detail',
              icon: Icons.info,
              action: ForwardArrowSetting(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListSetting extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget action;

  ListSetting({
    @required this.text,
    @required this.icon,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Icon(
            icon,
            color: Colors.blueGrey.shade700,
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade800,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: action,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LineSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(),
      ),
      Expanded(
        flex: 6,
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Divider(
            thickness: 0.6,
          ),
        ),
      ),
    ]);
  }
}

class ForwardArrowSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Colors.grey.shade700,
      ),
    );
  }
}

class TextHederListSetting extends StatelessWidget {
  final String text;
  TextHederListSetting(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade800,
          fontSize: 18,
        ),
      ),
    );
  }
}

Widget padding(Widget widget) {
  return Padding(
    padding: EdgeInsets.only(left: 20, bottom: 10),
    child: widget,
  );
}
