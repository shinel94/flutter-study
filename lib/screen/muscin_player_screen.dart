import 'package:flutter/material.dart';

class MusicPlayerSdreen extends StatefulWidget {
  const MusicPlayerSdreen({super.key});

  @override
  State<MusicPlayerSdreen> createState() => _MusicPlayerSdreenState();
}

class _MusicPlayerSdreenState extends State<MusicPlayerSdreen> {
  bool _isFirst = true;

  void _toggle() {
    setState(() {
      _isFirst = !_isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
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
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: _toggle,
                    child: Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey[300]),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    "노래",
                                    style: TextStyle(
                                      color:
                                          _isFirst ? Colors.blue : Colors.grey,
                                      fontSize: 12.0,
                                      fontWeight: _isFirst
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    "동영상",
                                    style: TextStyle(
                                      color: !_isFirst
                                          ? Colors.green
                                          : Colors.grey,
                                      fontSize: 12.0,
                                      fontWeight: !_isFirst
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedAlign(
                            alignment: _isFirst
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: _isFirst ? Colors.blue : Colors.green,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _isFirst ? "노래" : "동영상",
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
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.multitrack_audio_sharp),
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
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
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      "제목",
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 12.0),
                    ),
                    Text(
                      "제목",
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 8.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "좋아요버튼",
                            style: TextStyle(
                                decoration: TextDecoration.none, fontSize: 8.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "슬라이더",
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 8.0),
                    ),
                    Row(
                      children: [
                        Text(
                          "플레이 제어",
                          style: TextStyle(
                              decoration: TextDecoration.none, fontSize: 8.0),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
    );
  }
}
