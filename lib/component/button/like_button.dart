import 'package:flutter/material.dart';
import 'package:ui_practice/util/number_formatter.dart';

class LikeButton extends StatelessWidget {
  bool isLike;
  bool isUnlike;
  int likeCount;
  VoidCallback likeCallback;
  VoidCallback unlikeCallback;
  LikeButton({
    required this.isLike,
    required this.isUnlike,
    required this.likeCount,
    required this.likeCallback,
    required this.unlikeCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.0,
      height: 28.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0), color: Colors.grey[850]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: this.likeCallback,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isLike
                        ? Icons.thumb_up_alt_rounded
                        : Icons.thumb_up_alt_outlined,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    formatLikeCountInteger(this.likeCount),
                    style: TextStyle(
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1.0,
          ),
          GestureDetector(
            onTap: this.unlikeCallback,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Icon(
                isUnlike
                    ? Icons.thumb_down_alt_rounded
                    : Icons.thumb_down_alt_outlined,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
