import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class MonthPickerRow extends StatelessWidget {
  final String initialMonth;
  final void Function(String) onMonthSelected;

  const MonthPickerRow({
    super.key,
    required this.initialMonth,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String currentMonth = initialMonth;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 18, bottom: 12),
          child: Text(
            currentMonth,
            style: TextStyle(
              fontFamily: "NexaBold",
              fontSize: screenWidth / 20,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(top: 18, bottom: 12),
          child: GestureDetector(
            onTap: () async {
              final month = await showMonthYearPicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2099),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Colors.purpleAccent,
                        secondary: Colors.purple,
                        onSecondary: Colors.white,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                      ),
                      textTheme: const TextTheme(
                        headlineMedium: TextStyle(
                          fontFamily: "NexaBold",
                        ),
                        labelSmall: TextStyle(
                          fontFamily: "NexaBold",
                        ),
                        labelLarge: TextStyle(
                          fontFamily: "NexaBold",
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (month != null) {
                currentMonth = DateFormat('MMMM').format(month);
                onMonthSelected(currentMonth);
              }
            },
            child: Text(
              "Pick a Month",
              style: TextStyle(
                fontFamily: "NexaBold",
                fontSize: screenWidth / 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}