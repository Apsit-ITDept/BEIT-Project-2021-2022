// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers

import 'package:authentication/flashcards/all_constants.dart';
import 'package:authentication/flashcards/ques_ans_file.dart';
import 'package:authentication/flashcards/reusable_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Flash> {
  int _currentIndexNumber = 0;
  double _initial = 0.1;

  @override
  Widget build(BuildContext context) {
    String value = (_initial * 10).toStringAsFixed(0);
    return Container(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Container(
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              image: DecorationImage(
                scale: 1.2,
                fit: BoxFit.fill,
                image: ExactAssetImage('assets/images/raster/swipes3.png'),
              ),
            ),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text(
                    "Question $value of 10 Completed",
                    style: otherTextStyle,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 46, 46, 46),
                      valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                      minHeight: 5,
                      value: _initial,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: 300,
                      height: 300,
                      child: FlipCard(
                          direction: FlipDirection.VERTICAL,
                          front: ReusableCard(
                              text: quesAnsList[_currentIndexNumber].question),
                          back: ReusableCard(
                              text: quesAnsList[_currentIndexNumber].answer))),
                  Text("Tab to see Answer", style: otherTextStyle),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton.icon(
                            onPressed: () {
                              showPreviousCard();
                              updateToPrev();
                            },
                            icon:
                                Icon(FontAwesomeIcons.handPointLeft, size: 30),
                            label: Text(""),
                            style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(
                                    right: 20, left: 25, top: 15, bottom: 15))),
                        ElevatedButton.icon(
                            onPressed: () {
                              showNextCard();
                              updateToNext();
                            },
                            icon:
                                Icon(FontAwesomeIcons.handPointRight, size: 30),
                            label: Text(""),
                            style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(
                                    right: 20, left: 25, top: 15, bottom: 15)))
                      ])
                ])),
          )),
    );
  }

  void updateToNext() {
    setState(() {
      _initial = _initial + 0.1;
      if (_initial > 1.0) {
        _initial = 0.1;
      }
    });
  }

  void updateToPrev() {
    setState(() {
      _initial = _initial - 0.1;
      if (_initial < 0.1) {
        _initial = 1.0;
      }
    });
  }

  void showNextCard() {
    setState(() {
      _currentIndexNumber = (_currentIndexNumber + 1 < quesAnsList.length)
          ? _currentIndexNumber + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndexNumber = (_currentIndexNumber - 1 >= 0)
          ? _currentIndexNumber - 1
          : quesAnsList.length - 1;
    });
  }
}
