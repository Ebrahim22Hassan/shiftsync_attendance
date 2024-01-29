import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../widgets/my_custom_map_widget.dart';
import '../widgets/my_custom_neumorophic_button.dart';
import '../widgets/my_custom_bottom_navigation_bar.dart';
import '../widgets/slider_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);
    String formattedTime = "${now.hour}:${now.minute}";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey Employee!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Good Morning, Mark Your attendance",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/1077012.png"))),
                  )
                ],
              ),
              const Gap(35),

              // const SizedBox(
              //   width: double.infinity,
              //     child: Center(child: Text("09:00 AM",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),))),
              // const Gap(5),
              // const SizedBox(
              //   width: double.infinity,
              //     child: Center(child: Text("Oct 26,2022 - Wednesday",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),))),

          // MapSample(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/clock_in.png"))),
                              ),
                              const Text("--:--"),
                              const Text("Check In"),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/clock_out.png"))),
                              ),
                              const Text("--:--"),
                              const Text("Check Out"),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/total_hrs.png"))),
                              ),
                              const Text("--:--"),
                              const Text("Total hrs"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MyCustomMapWidget(),
                    // MyCustomSliderButton(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyCustomNeumorphicButton(buttonText: "Check In"),
                          Expanded(child: Container()),
                          MyCustomNeumorphicButton(buttonText: "Check Out"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // const Gap(90),

              // const Text(
              //   "Today's Status",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // const Gap(10),
              // const SizedBox(
              //   height: 200,
              //   child: Card(
              //     elevation: 1.2,
              //     child: Padding(
              //       padding: EdgeInsets.all(60),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Column(
              //                 children: [
              //                   Text(
              //                     "Check In",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w600,
              //                         fontSize: 16,
              //                         color: Colors.grey),
              //                   ),
              //                   Text(
              //                     "09:30",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                 ],
              //               ),
              //               Column(
              //                 children: [
              //                   Text(
              //                     "Check Out",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w600,
              //                         fontSize: 16,
              //                         color: Colors.grey),
              //                   ),
              //                   Text(
              //                     "02:30",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 16),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const Gap(10),
              // const MyCustomSliderButton(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //
              //     Text(
              //       formattedDate,
              //       style: const TextStyle(
              //           fontWeight: FontWeight.bold, fontSize: 16),
              //     ),
              //     Row(
              //       children: [
              //
              //         Text(
              //           formattedTime,
              //           style: const TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16),
              //         ),
              //         const Text(
              //           " Sat",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 16),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              //
            ],
          ),
        ),
      ),
      // bottomNavigationBar:const MyCustomBottomNavigationBar()
    );
  }
}
