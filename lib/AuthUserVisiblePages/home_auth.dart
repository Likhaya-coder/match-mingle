import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserHome extends StatefulWidget {
  const AuthUserHome({super.key});

  @override
  State<AuthUserHome> createState() => _AuthUserHomeState();
}

class _AuthUserHomeState extends State<AuthUserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                height: 50.0,
                color: Colors.pinkAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'MatchMingle',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }
}
