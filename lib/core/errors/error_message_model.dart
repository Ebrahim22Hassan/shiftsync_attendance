class ErrorMessageModel {
  final int? code;
  final String message;
  final bool? error;

  ErrorMessageModel({
    required this.message,
    this.code,
    this.error,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json['message'],
      code: json['code'],
      error: json['error'],
    );
  }
}