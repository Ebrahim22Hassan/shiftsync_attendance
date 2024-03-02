import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/map_state.dart';
import '../../../../core/services/location_helper.dart';
import '../../data/model/employee_attendence_model.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitialState());

  static MapCubit get(context) => BlocProvider.of<MapCubit>(context);
  // static const double referenceLatitude = 25.21982131171806;
  // static const double referenceLongitude = 45.8856693885365;
  static Position? position;

  static const double referenceLatitude = 23.602371;
  static const double referenceLongitude = 58.218023; // N e s t o
  late final double? distance;
  final double definedDistance = 12;
  bool locationStatus = false;

  Future<void> getMyCurrentLocation() async {
    emit(GetMyCurrentLocationLoadingState());
    await LocationHelper.getCurrentLocation();
    position = await Geolocator.getCurrentPosition().whenComplete(() async {
      try {
        await Geolocator.getCurrentPosition().then((position) {
          print(
              "Latitude: ${position.latitude}, Longitude: ${position.longitude}");
          distance = calculateDistance(position.latitude, position.longitude);
          print(
              "Distance to reference point: ${distance!.toStringAsFixed(2)} km");
          emit(GetMyCurrentLocationSuccessState());
          if (distance! < definedDistance) {
            locationStatus = true;
          }
        });
      } catch (e) {
        print("Error getting location: ${e.toString()}");
        emit(GetMyCurrentLocationErrorState());
      }
    });
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: locationStatus ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  double calculateDistance(double startLatitude, double startLongitude) {
    const double earthRadius = 6371.0; // Earth's radius in kilometers
    double dLat = _degreesToRadians(referenceLatitude - startLatitude);
    double dLon = _degreesToRadians(referenceLongitude - startLongitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(startLatitude)) *
            cos(_degreesToRadians(referenceLatitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c; // Distance in kilometers
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  late Timestamp currentTimeAndDate;
  late DateTime currentDate;
  String? checkInTime ;
  String? checkOutTime ;
  String? totalHrs ;
  late String dateString;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  void employeeCheckInRecord(String employeeId) async {
    try {
      currentTimeAndDate = Timestamp.now();
      currentDate = currentTimeAndDate.toDate();
      checkInTime = "${currentDate.hour}:${currentDate.minute}";
      dateString =
          "${currentDate.year}-${currentDate.month}-${currentDate.day}";
      CollectionReference attendanceCollection =
          fireStore.collection('StatusRecord');

      EmployeeAttendanceModel attendanceData = EmployeeAttendanceModel(
          id: employeeId,
          date: dateString,
          checkOutRecord: checkOutTime,
          checkInRecord: checkInTime,
          totalHrs: totalHrs);

      await attendanceCollection
          .doc(employeeId)
          .collection(employeeId)
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .set(attendanceData.toMap());
      print("check-In is recorded successfully to firebase");
    } catch (e) {
      print("Error recording check-in: $e");
    }


  }

  void employeeCheckOutRecord(String employeeId) async {
    try {
      currentTimeAndDate = Timestamp.now();
      currentDate = currentTimeAndDate.toDate();
      checkOutTime = "${currentDate.hour}:${currentDate.minute}";
      dateString =
          "${currentDate.year}-${currentDate.month}-${currentDate.day}";
      CollectionReference attendanceCollection =
          fireStore.collection('StatusRecord');
      calculateTotalHours(checkInTime!, checkOutTime!);
      EmployeeAttendanceModel attendanceData = EmployeeAttendanceModel(
          id: employeeId,
          date: dateString,
          checkOutRecord: checkOutTime,
          checkInRecord: checkInTime,
          totalHrs: totalHrs);

      await attendanceCollection
          .doc(employeeId)
          .collection(employeeId)
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .update(attendanceData.toMap());
      print("check-Out is recorded successfully to firebase");
    } catch (e) {
      print("Error recording check-in: $e");
    }
  }

  void calculateTotalHours(String checkInTime, String checkOutTime) {
    // Parse check-in and check-out times
    List<String> checkInParts = checkInTime.split(':');
    List<String> checkOutParts = checkOutTime.split(':');

    int checkInHour = int.parse(checkInParts[0]);
    int checkInMinute = int.parse(checkInParts[1]);

    int checkOutHour = int.parse(checkOutParts[0]);
    int checkOutMinute = int.parse(checkOutParts[1]);

    // Calculate total minutes
    int totalMinutes =
        (checkOutHour - checkInHour) * 60 + (checkOutMinute - checkInMinute);

    // Calculate hours and minutes
    int totalHours = totalMinutes ~/ 60;
    int remainingMinutes = totalMinutes % 60;

    // Format total hours and minutes
    String formattedHours = totalHours.toString().padLeft(2, '0');
    String formattedMinutes = remainingMinutes.toString().padLeft(2, '0');
    print("total hrs is ${formattedHours + formattedMinutes}");
    totalHrs = '$formattedHours:$formattedMinutes';
  }

  bool isCheckedIn = false;

  void changeCheckInOutStatus() {
    isCheckedIn = !isCheckedIn;
    emit(ChangeCheckInOutStatusState());
  }
}
