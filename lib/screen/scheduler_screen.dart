import 'package:flutter/material.dart';
import 'package:ui_practice/component/day_selecter.dart';
import 'package:ui_practice/component/month_year_selecter.dart';
import 'package:ui_practice/component/schedule_item_filter.dart';
import 'package:ui_practice/definition/selecter_option.dart';
import 'package:ui_practice/model/schedule_item.dart';

class SchedulerScreen extends StatefulWidget {
  const SchedulerScreen({super.key});

  @override
  State<SchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  DateTime selectedDate = DateTime.now();
  List<ScheduleItem> scheduleItemList = ScheduleItem.getDummyData(3);
  int selectedLocationIdx = 0;
  int selectedGameTypeIdx = 0;
  int selectedMatchStatusIdx = 0;

  void updateSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void updateLoationIdx(int idx) {
    setState(() {
      selectedLocationIdx = idx;
    });
  }

  void updateGameTypeIdx(int idx) {
    setState(() {
      selectedGameTypeIdx = idx;
    });
  }

  void updateMatchStatusIdx(int idx) {
    setState(() {
      selectedMatchStatusIdx = idx;
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
          Divider(
            thickness: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DropdownFilter(
                    label: "지역",
                    selectedIdx: selectedLocationIdx,
                    dropdownSelectCallback: updateLoationIdx,
                    dropDownItemList: LOCATION_SELECTER_OPTION_LIST,
                  ),
                  VerticalDivider(
                    thickness: 1.0,
                  ),
                  DropdownFilter(
                    label: "게임 유형",
                    selectedIdx: selectedGameTypeIdx,
                    dropdownSelectCallback: updateGameTypeIdx,
                    dropDownItemList: GAME_TYPE_SELECTER_OPTION_LIST,
                  ),
                  VerticalDivider(
                    thickness: 1.0,
                  ),
                  DropdownFilter(
                    label: "매치 상태",
                    selectedIdx: selectedMatchStatusIdx,
                    dropdownSelectCallback: updateMatchStatusIdx,
                    dropDownItemList: MATCH_STATUS_SELECTER_OPTION_LIST,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white70,
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text('1')),
                        Expanded(child: Text('2')),
                      ],
                    ),
                  ),
                );
              },
              itemCount: scheduleItemList.length * 10,
            ),
          ),
        ],
      ),
    ));
  }
}
