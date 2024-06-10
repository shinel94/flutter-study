import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_practice/definition/callback.dart';

class MonthYearSelecter extends StatelessWidget {
  final DateTime selectedDate;
  final DateTimeCallback updateSelectedDate;

  const MonthYearSelecter(
      {required this.selectedDate,
      required this.updateSelectedDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<int>(
          value: selectedDate.year,
          items: List.generate(100, (index) => index + 2000)
              .map((year) => DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  ))
              .toList(),
          onChanged: (value) {
            final int day = min(selectedDate.day,
                DateUtils.getDaysInMonth(value!, selectedDate.month));
            updateSelectedDate(DateTime(value!, selectedDate.month, day));
          },
        ),
        SizedBox(width: 20),
        DropdownButton<int>(
          value: selectedDate.month,
          items: List.generate(12, (index) => index + 1)
              .map((month) => DropdownMenuItem(
                    value: month,
                    child: Text(DateFormat.MMMM().format(DateTime(0, month))),
                  ))
              .toList(),
          onChanged: (value) {
            final int day = min(selectedDate.day,
                DateUtils.getDaysInMonth(selectedDate.year, value!));
            updateSelectedDate(DateTime(selectedDate.year, value!, day));
          },
        ),
      ],
    );
  }
}
