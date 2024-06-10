import 'package:flutter/material.dart';
import 'package:ui_practice/component/day_selecter.dart';
import 'package:ui_practice/component/month_year_selecter.dart';

class SchedulerScreen extends StatefulWidget {
  const SchedulerScreen({super.key});

  @override
  State<SchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  DateTime selectedDate = DateTime.now();

  void updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Container(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                    ),
                  ),
                  Text("일정 관리"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_box_outlined),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                MonthYearSelecter(
                  selectedDate: selectedDate,
                  updateSelectedDate: updateSelectedDate,
                ),
                DaySelecter(
                    selectedDate: selectedDate,
                    updateSelectedDate: updateSelectedDate)
              ],
            ),
          ),
          Container(
            child: Text("날짜별 데이터"),
          ),
        ],
      ),
    ));
  }
}
