import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../lib/ans.dart';

class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}

class _activityState extends State<activity> {

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Must watch videos ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: vlink.length - 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          vdoHorizontal(id: index, title: vtitle[index]),
                        ],
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Blogs ',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                ),
              ),
              BlogPage(),
            ],
          ),
        ),
      ],
    );
  }
}

class vdoHorizontal extends StatefulWidget {
  vdoHorizontal({super.key, required this.title, required this.id});
  String title;
  int id;
  @override
  State<vdoHorizontal> createState() => _vdoHorizontalState();
}

class _vdoHorizontalState extends State<vdoHorizontal> {
  final videoUrl = vlink[0];
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => youtubeVideo(id: widget.id)));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0, 0),
        child: Container(
          height: 110,
          width: 220,
          decoration: BoxDecoration(

            color: Color.fromARGB(255, 247, 189, 219),
            border: Border.all(
              color: Colors.white,
              // backgroundColor = Color.fromARGB(255, 221, 208, 255),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  // color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 0, 8),
                    child: Container(
                      height: 90,
                      width: 145,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset('assets/images/vdo.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class blog extends StatefulWidget {
  blog({super.key, required this.body, required this.title});
  String title;
  String body;

  @override
  State<blog> createState() => _blogState();
}

class _blogState extends State<blog> {
  double i = 1;
  bool scroll = true;
  bool ontap = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: GestureDetector(
          onTap: () {
            setState(() {
              i = 5;
              scroll = false;
            });
          },
          onDoubleTap: () {
            setState(() {
              scroll = true;
              i = 1;
            });
          },
          child: Container(
            height: 200 * i,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 183, 197, 255),
              border: Border.all(
                color: Colors.white,
                // backgroundColor = Color.fromARGB(255, 221, 208, 255),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: scroll
                    ? SingleChildScrollView(
                        child: Column(
                        children: [
                          Container(
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            // child: Text(widget.body,textAlign: TextAlign.justify,)
                          ),
                          Container(
                              // child: Text(widget.title,textAlign: TextAlign.justify,),
                              child: Text(
                            widget.body,
                            textAlign: TextAlign.justify,
                          )),
                        ],
                      ))
                    : Column(
                        children: [
                          Container(
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            // child: Text(widget.body,textAlign: TextAlign.justify,)
                          ),
                          Container(
                              child: Text(
                            widget.body,
                            textAlign: TextAlign.justify,
                          )),
                        ],
                      )),
          ),
        ),
      ),
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
            title: Text('Warning'),
            content: Text('Do you really want to exit?'),
            actions: [
              ElevatedButton(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(c, true),
              ),
              ElevatedButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(c, false),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
    );
  }
}

class youtubeVideo extends StatefulWidget {
  youtubeVideo({super.key, required this.id});
  int id = 0;

  @override
  State<youtubeVideo> createState() => _youtubeVideoState();
}

class _youtubeVideoState extends State<youtubeVideo> {
  // final videoUrl = vlink[widget.id];
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(vlink[widget.id]);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
      child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                  playedColor: Colors.deepPurpleAccent,
                  handleColor: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    ),
                child: Center(
                    child: Text(
                  'GO back',
                  style: TextStyle(fontSize: 12),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
