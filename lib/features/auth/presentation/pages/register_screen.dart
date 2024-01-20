import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/custom_Text_Form_Field.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
var nameController=TextEditingController();
var phoneController=TextEditingController();
var emailController=TextEditingController();
var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -100,
              right: -80,
              child:Container(
                width: 300.0, // Adjust the width and height as needed
                height: 300.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, .6),
                        Color.fromRGBO(143, 148, 251, 10),
                      ]
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        blurRadius: 20.0,
                        offset: Offset(5, 15)
                    )
                  ],

                  // color: Colors.blue, // Change the color as needed
                ),
              )),
          Positioned(
            top: 100,
              left: 20,
              child:Container(
                width: 100.0, // Adjust the width and height as needed
                height: 100.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, .6),
                        Color.fromRGBO(143, 148, 251, 10),
                      ]
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        blurRadius: 20.0,
                        offset: Offset(5, 15)
                    )
                  ],
                  shape: BoxShape.circle,
                  // color: Colors.blue, // Change the color as needed
                ),
              )),
          Positioned(
              top: 250,
              right: 10,
              child:Container(
                width: 40.0, // Adjust the width and height as needed
                height: 40.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),

                      ]
                  ),
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

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Gap(20),
                const Text("Sign Up", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 24),),
                const Gap(20),
                CustomTextFormField(
                    controller: nameController,
                    label: "Your name",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text),
                const Gap(20),
                CustomTextFormField(
                    controller: phoneController,
                    label: "Phone Number",
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone),
                const Gap(20),
                CustomTextFormField(
                    controller: emailController,
                    label: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress),
                const Gap(20),
                CustomTextFormField(
                    controller: passwordController,
                    label: "Password",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text),
                const Gap(20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/ 1.22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ]
                      )
                  ),
                  child: const Center(
                    child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
