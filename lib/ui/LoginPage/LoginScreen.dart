import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/FireBaseErorrCode.dart';
import 'package:todo/My%20Theme%20Data.dart';
import 'package:todo/ValidationUtils.dart';
import 'package:todo/database/UsersDao.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/providers/SettingsProvider.dart';
import 'package:todo/providers/TaskProvider.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/RegisterPage/RegisterScreen.dart';
import 'package:todo/ui/common/CustomFormField.dart';
import 'package:todo/ui/home/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(settingsProvider.getRegImage()),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.login,
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
                  ),

                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                  }, child:const Text('Create New Account?')),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                  }, child:const Text('Sign In With Phone Number?'))

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
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    var taskProvider = Provider.of<TaskProvider>(context,listen: false);
    try{
      DialogUtils.showLoading(context,'Loading...',isCancelable: false);
print(email.text);
print(password.text);
print('---------------');
      await authProvider.login(email.text, password.text);
      taskProvider.uid = authProvider.firebaseAuthUser!.uid;
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context,'User Logged in Successful',posActionTitle: 'OK',posAction:(){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });

    }
    on FirebaseAuthException catch (e) {
      print(e);
      DialogUtils.hideDialog(context);

      if (e.code == FireBaseErorrCode.userNotFound || e.code == FireBaseErorrCode.wrongPassword||
          e.code == FireBaseErorrCode.invalidLogin) {
        DialogUtils.showMessage(context,'Wrong Email or Password',posActionTitle:'OK' );
      }
    }
  }
}
