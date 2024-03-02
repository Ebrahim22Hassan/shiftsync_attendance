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
              color: color ?? Colors.blue,
              size: 150,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child:const Text(
              'something_went_wrong',
              style:  TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Text(
            'try_again',
            style:  TextStyle(
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
          // Container(
          //   height: 55,
          //   width: context.width * 0.55,
          //   margin: const EdgeInsets.symmetric(vertical: 15),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       foregroundColor: color ?? Theme.of(context).primaryColor,
          //       backgroundColor: color ?? Colors.blue,
          //       elevation: 500,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //     child: const Text(
          //       'reload_screen',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //           fontWeight: FontWeight.w700),
          //     ),
          //     onPressed: () {
          //       if (onPress != null) {
          //         onPress!();
          //       }
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}