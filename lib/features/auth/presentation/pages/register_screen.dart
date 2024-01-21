import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -100,
              right: -80,
              child: Container(
                width: 300.0, // Adjust the width and height as needed
                height: 300.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, .6),
                    Color.fromRGBO(143, 148, 251, 10),
                  ]),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        blurRadius: 20.0,
                        offset: Offset(5, 15))
                  ],

                  // color: Colors.blue, // Change the color as needed
                ),
              )),
          Positioned(
              top: 100,
              left: 20,
              child: Container(
                width: 100.0, // Adjust the width and height as needed
                height: 100.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, .6),
                    Color.fromRGBO(143, 148, 251, 10),
                  ]),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        blurRadius: 20.0,
                        offset: Offset(5, 15))
                  ],
                  shape: BoxShape.circle,
                  // color: Colors.blue, // Change the color as needed
                ),
              )),
          Positioned(
              top: 250,
              right: 10,
              child: Container(
                width: 40.0, // Adjust the width and height as needed
                height: 40.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ]),
                  shape: BoxShape.circle,
                  // color: Colors.blue, // Change the color as needed
                ),
              )),

          // Positioned(
          //    bottom: 60,
          //     right: 10,
          //     child:Container(
          //       width: 100.0, // Adjust the width and height as needed
          //       height: 100.0,
          //       decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //             colors: [
          //               Color.fromRGBO(143, 148, 251, 1),
          //               Color.fromRGBO(143, 148, 251, .6),
          //
          //             ]
          //         ),
          //         shape: BoxShape.circle,
          //         // color: Colors.blue, // Change the color as needed
          //       ),
          //     )),

          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Gap(20),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Gap(20),
                RegisterForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
