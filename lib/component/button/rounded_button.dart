import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? buttonTitle;
  final IconData buttonIcon;
  final bool isActive;
  final VoidCallback onClick;
  final double width;

  RoundedButton({
    this.buttonTitle,
    required this.buttonIcon,
    required this.isActive,
    required this.onClick,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final childrens = buttonTitle != null
        ? [
            Icon(
              buttonIcon,
              size: 16.0,
              color: isActive ? Colors.white : Colors.grey[700],
            ),
            const SizedBox(width: 8.0),
            Text(
              buttonTitle ?? "",
              style: TextStyle(
                fontSize: 12.0,
                decoration: TextDecoration.none,
                color: isActive ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w700,
              ),
            )
          ]
        : [
            Icon(
              buttonIcon,
              size: 16.0,
              color: isActive ? Colors.white : Colors.grey[700],
            )
          ];
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: 28.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.grey[850],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: childrens,
          ),
        ),
      ),
    );
  }
}
