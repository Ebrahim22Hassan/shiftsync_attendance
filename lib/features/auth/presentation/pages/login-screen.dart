import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/custom_Text_Form_Field.dart';

import '../../../../core/widgets/conditional_builder.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(143, 148, 251, .6),
                      Color.fromRGBO(143, 148, 251, 1),

                    ]
                ) ),
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
                          image: AssetImage('assets/images/light-1.png')
                      )
                  ),
                )
            ),
            Positioned(
                left: 140,
                width: 80,
                height: 150,
                child:  Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png')
                      )
                  ),
                )
            ),
            Positioned(
                right: 40,
                top: 40,
                width: 80,
                height: 150,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/clock.png')
                      )
                  ),
                )
            ),
            Positioned(
              top: 250,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
                ),
                child: Container(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Gap(30),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Gap(30),
                          Container(
                            height: 50,
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
                              child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                          const Gap(15),
                          // const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                          const Gap(30),
                          SizedBox(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Don\'t have an account?",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                // const Gap(10),
                                TextButton(
                                    onPressed: (){},
                                    child: const Text("REGISTER NOW",style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),))
                              ],),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),

          ],
        )
    );
  }
}
