import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../profile/domain/entities/profile_entities.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({
    super.key,
    required this.screenHeight,
    required this.thisMonth,
    required this.screenWidth,
    required this.profileEntity,
  });

  final ProfileEntity profileEntity;
  final double screenHeight;
  final String thisMonth;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight / 1.2,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('StatusRecord')
            .doc(profileEntity.id)
            .collection(profileEntity.id)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!.docs;
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) {
                DateTime date =
                    DateFormat('yyyy-MM-dd').parse(snap[index]['date']);
                return DateFormat('MMMM').format(date) == thisMonth
                    ? Container(
                        margin:
                            const EdgeInsets.only(top: 12, left: 6, right: 6),
                        height: 130,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.purpleAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Text(
                                    //DateFormat('EE\ndd').format(DateTime.now()),
                                    DateFormat('EE\ndd').format(date),
                                    style: TextStyle(
                                      fontFamily: "NexaBold",
                                      fontSize: screenWidth / 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Check In",
                                    style: TextStyle(
                                      fontFamily: "NexaRegular",
                                      fontSize: screenWidth / 25,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    snap[index]['checkInRecord'],
                                    style: TextStyle(
                                      fontFamily: "NexaBold",
                                      fontSize: screenWidth / 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Check Out",
                                    style: TextStyle(
                                      fontFamily: "NexaRegular",
                                      fontSize: screenWidth / 25,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    snap[index]['checkOutRecord'],
                                    style: TextStyle(
                                      fontFamily: "NexaBold",
                                      fontSize: screenWidth / 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox();
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
