import 'package:demo/data/store/login_store.dart';
import 'package:demo/pages/authentication/login_screen.dart';
import 'package:demo/pages/authentication/register_screen.dart';
import 'package:demo/pages/splash_page.dart';
import 'package:demo/utils/colors/app_colors.dart';
import 'package:demo/utils/language/language_application.dart';
import 'package:demo/utils/language/localization_delegate.dart';
import 'package:demo/utils/navigator/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'data/models/theme_model.dart';
import 'data/store/register_store.dart';



class ApplicationApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //provider state for theme of application
    return Injector(
      inject: [
        Inject(() => LoginStore("","")), //inject store for login repo
        Inject(() => RegisterStore("","","","")), //inject store for register repo
      ],
      builder: (context) {
        return MaterialApp(
          home: ApplicationAppState(),
        );
      },
    );
  }
}


class ApplicationAppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<ApplicationAppState> with WidgetsBindingObserver{
  final String appName = 'Biapay'; //app name
  DemoLocalizationsDelegate _newLocaleDelegate;


  @override
  void initState() {
    super.initState();
    //observe binder at start
    //language initialization
    WidgetsBinding.instance.addObserver(this);
    _newLocaleDelegate = DemoLocalizationsDelegate(newLocale: null);
    languageApplication.onLocaleChanged = onLocaleChange;
  }


  //dispose your binder here when destroyed
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  /*default binder for locale
  * super*/
  @override
  void didChangeLocales(List<Locale> locale) {
    _updateRemoteConfig();
  }

  //update your app
  Future<void> _updateRemoteConfig() async {
    languageApplication.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = DemoLocalizationsDelegate(newLocale: locale);
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: AppColors.colorBlue,
        localizationsDelegates: [
          _newLocaleDelegate,

          //provides localised strings
          GlobalMaterialLocalizations.delegate,
          //provides RTL support
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          //english support
          const Locale("en"),
          //french
          const Locale("fr_FR"),
        ],
        title: appName,
        navigatorKey: Keys.navKey,  //app navigator key(init here)....
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark, //theme of app
          primaryColor:AppColors.colorBlue,
        ),
        home: SplashScreen(),         //home screen(default screen to show)
        //define routes for application.......
        routes: <String, WidgetBuilder>{
          //set all routes of app here...
          Routes.registerScreen: (context) {
            //Register Page
            return RegisterScreen();
          },
          Routes.signInScreen: (context) {
            //Register Page
            return LoginScreen();
          },
        }
    );
  }
}
