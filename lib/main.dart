import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/My%20Theme%20Data.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/providers/TaskProvider.dart';
import 'package:todo/ui/LoginPage/LoginScreen.dart';

import 'package:todo/ui/RegisterPage/RegisterScreen.dart';
import 'package:todo/ui/Splash/SplashScreen.dart';
import 'package:todo/ui/edit/EditScreen.dart';

import 'package:todo/ui/home/HomeScreen.dart';

import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var settingsProvider = SettingsProvider();
  await settingsProvider.loadThemeData();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(

      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthProvider()),
            ChangeNotifierProvider(create: (_)=> SettingsProvider()),
            ChangeNotifierProvider(create: (_)=> TaskProvider()),


          ],

                   child: MyApp()


      ));
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  var settingsProvider  = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'To Do',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode:settingsProvider.currentTheme ,
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'),
        Locale('ar')
      ],
      locale: settingsProvider.currentLocale,



      routes: {
        LoginScreen.routeName : (_) => LoginScreen(),
        HomeScreen.routeName : (_)=> HomeScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        SplashScreen.routeName :(_)=>SplashScreen(),
        //EditScreen.routeName :(_)=>EditScreen()
      },
      initialRoute: SplashScreen.routeName,

    );
  }
}


