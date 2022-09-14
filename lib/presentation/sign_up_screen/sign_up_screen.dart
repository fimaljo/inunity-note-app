import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inunity/core/utils.dart';
import 'package:inunity/presentation/home/home_page.dart';
import 'package:inunity/presentation/login_screen/login_screen.dart';
import 'package:inunity/presentation/login_screen/widgets/already_have_an_account_check.dart';
import 'package:inunity/presentation/login_screen/widgets/input_field.dart';
import 'package:inunity/presentation/login_screen/widgets/password_field.dart';
import 'package:inunity/presentation/login_screen/widgets/rounded_button.dart';

import '../../infrastructure/auth/auth_methods.dart';
import '../main_page/main_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something wrong'));
            } else if (snapshot.hasData) {
              return MainPage();
            } else {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "SIGNUP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Image.asset(
                        "assets/images/Sign up-bro.png",
                        height: size.height * 0.35,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      RoundedInputField(
                        hintText: 'Your Email',
                        controller: emailController,
                      ),
                      RoundedPasswordField(
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      RoundedButton(
                        text: 'SIGNUP',
                        onPressed: () {
                          signUp();
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => MainPage()));
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        login: false,
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    try {
      String res = await AuthMethods().signupUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (res == 'success') {
        Utils.showSnackBar("success");
      }
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
