import 'package:flutter/material.dart';
import 'package:ui_practice/definition/callback.dart';

class DropdownFilter extends StatelessWidget {
  final String label;
  final int selectedIdx;
  final DropdownSelectCallback dropdownSelectCallback;
  final List<String> dropDownItemList;

  const DropdownFilter({
    required this.label,
    required this.selectedIdx,
    required this.dropdownSelectCallback,
    required this.dropDownItemList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black87, fontSize: 11.0),
        ),
        SizedBox(
          width: 8.0,
        ),
        DropdownButton<int>(
          value: selectedIdx,
          items: [
            for (var i = 0; i < dropDownItemList.length; i++)
              DropdownMenuItem(
                value: i,
                child: Text(dropDownItemList[i]),
              )
          ],
          onChanged: (value) {
            if (value != null) {
              dropdownSelectCallback(value);
            }
          },
        ),
      ],
    );
  }
}
