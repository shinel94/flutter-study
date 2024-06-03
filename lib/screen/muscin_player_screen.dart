import 'package:flutter/material.dart';
import 'package:ui_practice/component/button/like_button.dart';
import 'package:ui_practice/component/button/rounded_button.dart';
import 'package:ui_practice/component/slider_header.dart';
import 'package:ui_practice/util/number_formatter.dart';

class MusicPlayerSdreen extends StatefulWidget {
  const MusicPlayerSdreen({super.key});

  @override
  State<MusicPlayerSdreen> createState() => _MusicPlayerSdreenState();
}

class _MusicPlayerSdreenState extends State<MusicPlayerSdreen> {
  bool isFirstHeader = true;
  bool isSelectedMusicLike = false;
  bool isSelectedMusicUnlike = false;
  bool isPlaying = false;
  int likeCount = 3190;

  int musicLengthSeconds = 317;
  int nowSeconds = 0;

  void toggleHeader() {
    setState(() {
      isFirstHeader = !isFirstHeader;
    });
  }

  void toggleMusicLike() {
    if (isSelectedMusicLike) {
      setState(() {
        isSelectedMusicLike = false;
        likeCount = likeCount - 1;
      });
    } else {
      setState(() {
        isSelectedMusicLike = true;
        likeCount = likeCount + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black87),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_outlined),
                      color: Colors.white,
                    ),
                    SliderHeader(toggle: toggleHeader, isFirst: isFirstHeader),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.multitrack_audio_sharp),
                          color: Colors.white,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                            color: Colors.white),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Image(
                      image: AssetImage('assets/img/1.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Attention [노래 제목]",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        "NewJeans [가수]",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[350],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            LikeButton(
                              isLike: isSelectedMusicLike,
                              isUnlike: isSelectedMusicUnlike,
                              likeCount: likeCount,
                              likeCallback: toggleMusicLike,
                              unlikeCallback: () {
                                setState(() {
                                  isSelectedMusicUnlike =
                                      !isSelectedMusicUnlike;
                                });
                              },
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            RoundedButton(
                              buttonIcon: Icons.document_scanner_outlined,
                              buttonTitle: "35",
                              isActive: true,
                              onClick: () {},
                              width: 64.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            RoundedButton(
                              buttonIcon: Icons.playlist_add_outlined,
                              buttonTitle: "저장",
                              isActive: true,
                              onClick: () {},
                              width: 70.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            RoundedButton(
                              buttonIcon: Icons.switch_access_shortcut_rounded,
                              buttonTitle: "공유",
                              isActive: true,
                              onClick: () {},
                              width: 70.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            RoundedButton(
                              buttonIcon: Icons.download,
                              buttonTitle: "오프라인 저장",
                              isActive: true,
                              onClick: () {},
                              width: 120.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            RoundedButton(
                              buttonIcon: Icons.broadcast_on_personal_outlined,
                              buttonTitle: "뮤직 스테이션",
                              isActive: true,
                              onClick: () {},
                              width: 120.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 12,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6.0,
                            ), // 썸의 크기 변경
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 9.0,
                            ), // 썸이 눌렸을 때 오버레이 크기 변경,
                            thumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey[700],
                            activeTrackColor: Colors.white,
                          ),
                          child: Slider(
                            value: nowSeconds / musicLengthSeconds,
                            min: 0,
                            max: 1,
                            divisions: musicLengthSeconds,
                            onChanged: (value) {
                              setState(() {
                                nowSeconds =
                                    (value * musicLengthSeconds).toInt();
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatIntToMinSeconds(nowSeconds),
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  decoration: TextDecoration.none,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              formatIntToMinSeconds(musicLengthSeconds),
                              style: TextStyle(
                                  color: Colors.grey[300],
                                  decoration: TextDecoration.none,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shuffle,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            icon: Icon(
                              isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: Colors.white,
                              size: 48.0,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.compare_arrows_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "다음 트랙",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "가사",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "관련 항목",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
