import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/My%20Theme%20Data.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/ui/LoginPage/LoginScreen.dart';

import 'package:todo/ui/RegisterPage/RegisterScreen.dart';
import 'package:todo/ui/Splash/SplashScreen.dart';

import 'package:todo/ui/home/HomeScreen.dart';

import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(

      ChangeNotifierProvider(
        create: (buildContext)=>
          AuthProvider()
        ,
      child: MyApp(),)
      );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,


      routes: {
        LoginScreen.routeName : (_) => LoginScreen(),
        HomeScreen.routeName : (_)=> HomeScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        SplashScreen.routeName :(_)=>SplashScreen()
      },
      initialRoute: SplashScreen.routeName,

    );
  }
}


