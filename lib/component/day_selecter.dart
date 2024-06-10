import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_practice/definition/callback.dart';

class DaySelecter extends StatefulWidget {
  final DateTime selectedDate;
  final DateTimeCallback updateSelectedDate;

  DaySelecter(
      {required this.selectedDate,
      required this.updateSelectedDate,
      super.key});

  @override
  State<DaySelecter> createState() => _DaySelecterState();
}

class _DaySelecterState extends State<DaySelecter> {
  final ScrollController scrollController = ScrollController();

  void scrollToSelectedDate() {
    if (scrollController.hasClients) {
      final index = widget.selectedDate.day - 1;
      final screenWidth = MediaQuery.of(context).size.width;
      final itemWidth = 58.0; // 각 아이템의 폭
      final targetScrollOffset =
          index * itemWidth - screenWidth / 2 + itemWidth / 2;
      if (targetScrollOffset > 0) {
        scrollController.jumpTo(targetScrollOffset);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // 위젯이 초기화된 후에 스크롤 위치를 조정합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToSelectedDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollToSelectedDate();

    final daysInMonth = DateUtils.getDaysInMonth(
        widget.selectedDate.year, widget.selectedDate.month);
    final firstDayOfMonth =
        DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);

    return Container(
      height: 40,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: daysInMonth,
        itemBuilder: (context, index) {
          final date = firstDayOfMonth.add(Duration(days: index));
          final isSaturday = date.weekday == DateTime.saturday;
          final isSunday = date.weekday == DateTime.sunday;
          // final isHoliday = _holidays.any((holiday) =>
          //     holiday.year == date.year &&
          //     holiday.month == date.month &&
          //     holiday.day == date.day);
          final dateColor = isSunday
              ? Colors.red
              : isSaturday
                  ? Colors.blue
                  : Colors.black;

          return GestureDetector(
            onTap: () {
              widget.updateSelectedDate(date);
            },
            child: Container(
              width: 50,
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: date.day == widget.selectedDate.day
                      ? dateColor
                      : Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                DateFormat.d().format(date),
                style: TextStyle(
                  color: dateColor,
                  fontWeight: widget.selectedDate == date
                      ? FontWeight.w800
                      : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
