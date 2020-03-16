import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_test/project/commons/constants/theme.dart';
import 'package:store_test/project/commons/utils/theme.dart';
import 'package:store_test/project/page/main_wg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en', supportedLocales: ['en', 'th']);
  await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  var darkModeOn = prefs.getBool('darkMode') ?? false;
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
      child: LocalizedApp(delegate, BaiwaRootApp(prefs: prefs)),
    ),
  );
}

class BaiwaRootApp extends StatelessWidget {
  final SharedPreferences prefs;
  BaiwaRootApp({@required this.prefs});

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    String languageSetting = prefs.getString('languageSetting');

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        // local  setting
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: languageSetting == null
            ? localizationDelegate.currentLocale
            : Locale(languageSetting),
        //-- local  setting

        title: 'STORE TEST',
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.getTheme(),
        home: MyHomePage(),
      ),
    );
  }
}
