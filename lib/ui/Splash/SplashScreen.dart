import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/providers/TaskProvider.dart';
import 'package:todo/ui/LoginPage/LoginScreen.dart';
import 'package:todo/ui/home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), () {
      navigate();
    });
  }
  @override
  Widget build(BuildContext context) {
  var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Image.asset(settingsProvider.getSplashImage(),fit: BoxFit.fill,),

    );
  }

  void navigate() async{
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    var taskProvider = Provider.of<TaskProvider>(context,listen: false);
      if(FirebaseAuth.instance.currentUser != null){
        await authProvider.retrieveUserFromDatabase();
        taskProvider.uid = authProvider.firebaseAuthUser!.uid;
         Navigator.pushReplacementNamed(context,HomeScreen.routeName);

      }else{
         await Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }


  }
}
