import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:game_box/one_vs_one.dart';
import 'package:animated_button/animated_button.dart';

List<List<String>> imgList = [
  ['assets/46124.jpg', '1 vs 1'],
  ['assets/28098.jpg', 'Team vs team'],
];

List<String> title = [];

class PeerToPeer extends StatefulWidget {
  @override
  _PeerToPeerState createState() => _PeerToPeerState();
}

class _PeerToPeerState extends State<PeerToPeer> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 290,
                  height: 290,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(item[0]))),
                ),
                SizedBox(height: 40),
                Text(
                  item[1],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedButton(
                        width: 100,
                        color: Colors.yellow[900],
                        child: Text(
                          'Join',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          showAnimatedDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Room ID'),
                                content: TextField(
                                  keyboardType: TextInputType.number,
                                ),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('cancel'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                            animationType: DialogTransitionType.scaleRotate,
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(seconds: 1),
                          );
                        }),
                    AnimatedButton(
                      width: 150,
                      color: Colors.blueAccent,
                      child: Text(
                        'Create Room',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => OneVsOne()));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Peer to Peer'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]),
          ),
          child: game(imageSliders),
        ),
      ),
    );
  }

  game(List<Widget> imageSliders) => Container(
        height: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 0.7,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      );
}
