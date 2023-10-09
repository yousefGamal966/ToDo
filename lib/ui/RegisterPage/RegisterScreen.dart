import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/database/model/User.dart'as MyUser;
import '../../FireBaseErorrCode.dart';
import '../../ValidationUtils.dart';
import '../../database/UsersDao.dart';
import '../DialogUtils.dart';
import '../LoginPage/LoginScreen.dart';
import '../common/CustomFormField.dart';
import 'dart:js_interop';
class RegisterScreen extends StatefulWidget {
  static const String routeName = 'reg';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();

  TextEditingController userName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController passwordConfirmation = TextEditingController();

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
              'Register',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFormFiled(
                        hintText: 'Full Name',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Full Name';
                          }
                          return null;
                        },
                        controller: fullName,
                      ),
                      CustomFormFiled(
                        hintText: 'Username',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Username';
                          }
                          return null;
                        },
                        controller: userName,
                      ),
                      CustomFormFiled(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Full Name';
                          }
                          if (!isValidEmail(text)) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                        controller: email,
                      ),
                      CustomFormFiled(
                        hintText: 'Password',
                        secureText: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (text.length < 6) {
                            return 'Password Should Be At Least 6 Characters';
                          }
                          return null;
                        },
                        controller: password,
                      ),
                      CustomFormFiled(
                        hintText: 'Confirm Password',
                        secureText: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please Enter Password Confirmation';
                          }
                          if (password.text != text) {
                            return "Password Doesn't Match ";
                          }
                          return null;
                        },
                        controller: passwordConfirmation,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          createAccount();
                        },
                        child: Text(
                          'Create Account',
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
            ),
          ),
        ));
  }

  void createAccount() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      DialogUtils.showLoading(context, 'Creating Account.Please Wait');
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      // await UsersDao.createUser(MyUser.User(
      //   id:result.user?.uid ,
      //   fullName:fullName.text ,
      //   userName:userName.text ,
      //   email:email.text ,
      //
      // ) );
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'Account Created Successfully',
          posActionTitle: 'OK', posAction: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      });
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == FireBaseErorrCode.weakPassword) {
        print('The password provided is too weak.');
        DialogUtils.showMessage(context, 'The password provided is too weak.',
            posActionTitle: 'OK');
      } else if (e.code == FireBaseErorrCode.emailInUse) {
        print('The account already exists for that email.');
        DialogUtils.showMessage(
            context, 'The account already exists for that email.',
            posActionTitle: 'OK');
      }
    } catch (e) {
      print(e);
    }
  }
}
