import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import '../../../profile/domain/entities/profile_entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../pages/attendance_history_screen.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.profileEntity,
  });

  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('StatusRecord')
                    .doc(profileEntity.id)
                    .collection(profileEntity.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    final now = DateTime.now();
                    final currentDay = now.day;
                    final daysInMonth =
                        DateTime(now.year, now.month + 1, 0).day;
                    // List to store the color of each segment
                    List<Color?> segmentColors =
                        List.generate(daysInMonth, (index) => null);
                    // Iterate through attendance records to determine segment colors
                    for (final doc in snap) {
                      DateTime date =
                          DateFormat('yyyy-MM-dd').parse(doc['date']);
                      if (date.month == now.month && date.year == now.year) {
                        int day = date.day;
                        if (day <= currentDay) {
                          segmentColors[day - 1] =
                              (doc['checkInRecord'] != null)
                                  ? Colors.green
                                  : Colors.red;
                        }
                      }
                    }

                    // Set the remaining days to red if no attendance record exists
                    for (int i = 0; i < currentDay; i++) {
                      if (segmentColors[i] == null) {
                        segmentColors[i] = Colors.red;
                      }
                    }

                    // Function to determine the color of each segment
                    Color customColor(int index) {
                      return segmentColors[index] ?? AppColors().grey;
                    }

                    // Calculate the number of attended days
                    int attendedDays = segmentColors
                        .where((color) => color == Colors.green)
                        .length;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '$attendedDays / $daysInMonth',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                        ),
                        CircularStepProgressIndicator(
                          totalSteps: daysInMonth,
                          currentStep: currentDay,
                          stepSize: 30,
                          selectedColor: Colors.green,
                          unselectedColor: Colors.grey,
                          padding: 0.02,
                          width: 260,
                          height: 260,
                          selectedStepSize: 40,
                          //roundedCap: (_, __) => true,
                          customColor: customColor,
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceHistoryScreen(
                          profileEntity: profileEntity,
                        ),
                      ));
                },
                icon: const Icon(Icons.list),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
