import 'package:flutter/material.dart';

class NoMoreData extends StatelessWidget {
  const NoMoreData({
    super.key,
    required this.index,
    required this.hasMoreData,
    required this.limit,
    this.textColor = Colors.black,
  });

  final int index;
  final bool hasMoreData;
  final int limit;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: hasMoreData ? const CircularProgressIndicator() :
        limit > index ? const SizedBox() : Text('No more data 🤷‍♂️ ',
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}