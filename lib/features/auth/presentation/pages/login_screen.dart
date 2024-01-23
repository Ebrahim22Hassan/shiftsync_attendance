import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(143, 148, 251, .6),
                  Color.fromRGBO(143, 148, 251, 1),
                ])),
                height: 300,
              ),
            ),
            Positioned(
                left: 30,
                width: 80,
                height: 200,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'))),
                )),
            Positioned(
                left: 140,
                width: 80,
                height: 150,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'))),
                )),
            Positioned(
                right: 40,
                top: 40,
                width: 80,
                height: 150,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'))),
                )),
            Positioned(
              top: 250,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  child: const SizedBox(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: LoginForm(),
                    ),
                  )),
            ),

          ],
        ));
  }
}
