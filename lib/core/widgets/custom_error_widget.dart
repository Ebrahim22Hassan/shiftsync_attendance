import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? errorMessage;
  final Color? color;

  const CustomErrorWidget({
    super.key,
    this.onPress,
    this.errorMessage,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.warning_amber_rounded,
              color: color ?? Colors.black,
              size: 150,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: const Text(
              'something_went_wrong',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Text(
            'Try to Logout then Login again',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            errorMessage ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
