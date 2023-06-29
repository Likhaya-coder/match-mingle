import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_mingle/Components/account_header.dart';
import 'package:match_mingle/constants.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class ForgotPassword extends StatefulWidget {
  static String id = "ForgotPassword";

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _getEmail = TextEditingController();
  bool _saving = false;

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _getEmail.text.trim(),
      );
      setState(() {
        _saving = false;
      });
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text('Password reset link sent. Check your emails.'),
        );
      });
    } on FirebaseAuthException catch(e) {
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
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: const [
                    AccountHeaderContainer(
                      color: Colors.pinkAccent,
                      title: 'Forgot Password',
                      text: 'Did you forget your password?',
                    ),
                  ],
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
                          const Text(
                              'No worries we\'ll send you reset instructions, take the first step by entering your email below.'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _getEmail,
                            decoration: kEmailTextInput.copyWith(
                              hintText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
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
                                passwordReset();
                              },
                              minWidth: double.infinity,
                              height: 60.0,
                              child: const Text(
                                'Reset',
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
