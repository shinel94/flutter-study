import 'package:flutter/material.dart';

class SliderHeader extends StatelessWidget {
  final VoidCallback toggle;
  final bool isFirst;

  const SliderHeader({
    required this.toggle,
    required this.isFirst,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 120,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.grey[900]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "노래",
                      style: TextStyle(
                        color: isFirst ? Colors.grey[700] : Colors.grey,
                        fontSize: 12.0,
                        fontWeight:
                            isFirst ? FontWeight.bold : FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "동영상",
                      style: TextStyle(
                        color: !isFirst ? Colors.grey[700] : Colors.grey,
                        fontSize: 12.0,
                        fontWeight:
                            !isFirst ? FontWeight.bold : FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedAlign(
              alignment: isFirst ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[700],
                ),
                alignment: Alignment.center,
                child: Text(
                  isFirst ? "노래" : "동영상",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
