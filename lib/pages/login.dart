import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_mingle/Components/account_header.dart';
import 'package:match_mingle/pages/forgot_password.dart';
import 'package:match_mingle/pages/signup.dart';
import 'package:match_mingle/pages/navigation.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _getEmail = TextEditingController();
  final _getPassword = TextEditingController();
  bool _saving = false;

  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _getEmail.text.trim(),
        password: _getPassword.text.trim(),
      );
      Navigator.pushNamed(context, NavigationScreen.id);
      setState(() {
        _saving = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _saving = false;
      });
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          color: Colors.pinkAccent,
          inAsyncCall: _saving,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: const [
                    AccountHeaderContainer(
                      color: Colors.pinkAccent,
                      title: 'Sign-in',
                      text: 'Sign in to your account',
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _getEmail,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.pinkAccent, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.pinkAccent, width: 2.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                            obscureText: true,
                            controller: _getPassword,
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.pinkAccent, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.pinkAccent, width: 2.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, SignupScreen.id);
                                },
                                child: const Text(
                                  ' Sign Up',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Material(
                            color: Colors.pinkAccent,
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(2.0),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _saving = true;
                                });
                                login();
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, ForgotPassword.id);
                                },
                                child: const Text(
                                  'Forgot your password? ',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
