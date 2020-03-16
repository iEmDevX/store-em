import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_test/project/commons/i18n/keys.dart';

class LangSettingPage extends StatefulWidget {
  @override
  _LangSettingPageState createState() => _LangSettingPageState();
}

class _LangSettingPageState extends State<LangSettingPage> {
  void _setValue2(String value) => setState(() {
        initLang = value;
        changeLocale(context, value);
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('languageSetting', value);
        });
      });

  List languageList = [
    {"language": "ภาษาไทย", "countryAbbreviations": "th"},
    {"language": "English", "countryAbbreviations": "en"},
  ];

  Widget makeRadioTiles() {
    List<Widget> list = List<Widget>();

    for (var item in languageList) {
      list.add(RadioListTile<String>(
        value: item['countryAbbreviations'],
        groupValue: initLang,
        onChanged: _setValue2,
        activeColor: Color(0xFF3BBDB1),
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          '${item['language']}',
          style: TextStyle(fontSize: 20),
        ),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }

  String initLang = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var localization =
    initLang = LocalizedApp.of(context).delegate.currentLocale.languageCode;
    // initLang = translate(getCurrentLanguageLocalizationKey(localization));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(Keys.Setting_Page_Languages_Setting_Appbar),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: <Widget>[
                makeRadioTiles(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCurrentLanguageLocalizationKey(String code) {
    switch (code) {
      case "en":
        return Keys.Language_En;
      case "th":
        return Keys.Language_Th;
      default:
        return null;
    }
  }
}
