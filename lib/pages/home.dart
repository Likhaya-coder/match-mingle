import 'package:flutter/material.dart';
import 'package:match_mingle/pages/signup.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _saving = false;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/home.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                      child: Text(
                        'MatchMingle - Where Love Begins Today!',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                      child: Text(
                        'Unleash your flirtatious spirit and embark on a thrilling journey of romance. Discover a sanctuary where sparks fly, hearts dance, and soulful connections blossom. Join MatchMingle today and let your love story unfold in a realm of endless possibilities.',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SignupScreen.id);
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              minimumSize: Size(120.0, 50.0),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
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
