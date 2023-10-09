import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/FireBaseErorrCode.dart';
import 'package:todo/My%20Theme%20Data.dart';
import 'package:todo/ValidationUtils.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/common/CustomFormField.dart';
import 'package:todo/ui/home/HomeScreen.dart';
import 'dart:js_interop';
class LoginScreen extends StatefulWidget {
  static const String routeName = 'log';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/reg_back_screen.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Login',
              style: Theme.of(context).textTheme.headlineLarge
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key:formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


                  CustomFormFiled(
                      hintText: 'Email',

                      keyboardType: TextInputType.emailAddress
                      ,validator:(text){
                    if(text == null||text.trim().isEmpty){
                      return 'Please Enter Full Name';
                    }
                    if(!isValidEmail(text)){
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },controller: email,
                  ),
                  CustomFormFiled(
                    hintText: 'Password',
                    secureText: true,validator:(text){
                    if(text == null||text.trim().isEmpty){
                      return 'Please Enter Password';
                    }
                    if(text.length<6){
                      return 'Password Should Be At Least 6 Characters';
                    }
                    return null;
                  },controller: password,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor)),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void login() async {
    if(
    formKey.currentState?.validate() == false){
      return ;

    }
    try{
      DialogUtils.showLoading(context,'Loading...',isCancelable: false);
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context,'User Logged in Successful',posActionTitle: 'OK',posAction:(){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });

    }
    on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);

      if (e.code == FireBaseErorrCode.userNotFound || e.code == FireBaseErorrCode.wrongPassword||
          e.code == FireBaseErorrCode.invalidLogin) {
        DialogUtils.showMessage(context,'Wrong Email or Password',posActionTitle:'OK' );
      }
    }
  }
}
