
class EmployeeAttendanceModel {
  late String id;
  late String date;
  String? checkInRecord;
  String? checkOutRecord;
  String? totalHrs ;

  EmployeeAttendanceModel({
    required this.id,
    required this.date,
    this.checkInRecord,
    this.checkOutRecord,
    this.totalHrs,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'checkInRecord': checkInRecord,
      'checkOutRecord': checkOutRecord,
      'totalHrs': totalHrs,
    };
  }



  factory EmployeeAttendanceModel.fromMap(Map<String, dynamic> json) {
    return EmployeeAttendanceModel(
      id: json['id'],
      date: json['date'],
      checkInRecord: json['checkInRecord'],
      checkOutRecord: json['checkOutRecord'],
      totalHrs: json['totalHrs'] ?? 0.0,
    );
  }
}


