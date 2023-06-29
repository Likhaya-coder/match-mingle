import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_mingle/Components/account_header.dart';
import 'package:match_mingle/constants.dart';
import 'package:match_mingle/pages/navigation.dart';
import 'package:match_mingle/pages/login.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class SignupScreen extends StatefulWidget {
  static String id = "SignupScreen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _getUsername = TextEditingController();
  final _getEmail = TextEditingController();
  final _getPassword = TextEditingController();
  final _getPasswordRepeat = TextEditingController();

  bool _saving = false;

  Future saveUserData() async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': _getUsername.text.trim(),
      'email': _getEmail.text.trim(),
    });
  }

  Future signup() async {
    try {
      if (_getPassword.text.trim() != _getPasswordRepeat.text.trim()) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text('Passwords do not match!'),
              );
            });
        setState(() {
          _saving = false;
        });
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _getEmail.text.trim(),
          password: _getPassword.text.trim(),
        );
        saveUserData();
        Navigator.pushNamed(context, NavigationScreen.id);
        _saving = false;
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _saving = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
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
          inAsyncCall: _saving,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: const [
                    AccountHeaderContainer(
                      color: Colors.pinkAccent,
                      title: 'Account',
                      text: 'Create an account',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _getUsername,
                            decoration: kEmailTextInput.copyWith(
                                hintText: 'Enter your username'),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                            controller: _getEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: kEmailTextInput.copyWith(
                              hintText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                            controller: _getPassword,
                            obscureText: true,
                            decoration: kPasswordTextInput.copyWith(),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextField(
                              controller: _getPasswordRepeat,
                              obscureText: true,
                              decoration: kPasswordTextInput.copyWith(
                                  hintText: 'Repeat your password')),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                },
                                child: const Text(
                                  ' Log-in',
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
                                signup();
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
