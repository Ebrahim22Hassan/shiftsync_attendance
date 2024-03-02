import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../profile/domain/entities/profile_entities.dart';
import 'history_list_view.dart';
import '../widgets/month_picker_row.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({
    super.key, required this.profileEntity,
  });

  final ProfileEntity profileEntity;

  @override
  State<AttendanceHistoryScreen> createState () =>
      _AttendanceHistoryScreenState () ;
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  late String thisMonth;

  @override
  void initState() {
    super.initState();
    thisMonth = DateFormat('MMMM').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 3,
          child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent,
            title: Text(
              "Attendance Details",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "NexaBold",
                fontSize: screenWidth / 23,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            MonthPickerRow(
              initialMonth: thisMonth,
              onMonthSelected: (selectedMont) {
                setState(() {
                  thisMonth = selectedMont;
                });
              },
            ),
            HistoryListView(
                profileEntity: widget.profileEntity,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                thisMonth: thisMonth),
          ],
        ),
      ),
    );
  }
}
