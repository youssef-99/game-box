import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

class OneVsOne extends StatefulWidget {
  @override
  _OneVsOneState createState() => _OneVsOneState();
}

class _OneVsOneState extends State<OneVsOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: AnimatedButton(
          color: Colors.yellow[900],
          child: Text(
            'Start Game',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 5, right: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/797.jpg'), fit: BoxFit.fill),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.red]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              photos(),
            ],
          ),
        ),
      ),
    );
  }

  photos() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              shapeOfPhoto('assets/60111.jpg'),
              SizedBox(height: 10),
              Text(
                'Youssef William',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              )
            ],
          ),
          SizedBox(width: 150),
          Column(
            children: [
              shapeOfPhoto('assets/60111.jpg'),
              SizedBox(height: 10),
              Text(
                'Micheal Murice',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              )
            ],
          ),
        ],
      );

  shapeOfPhoto(String photo) => Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(photo), fit: BoxFit.fill)),
      );
}
