import 'dart:async';
import 'dart:math';

import 'package:clock_app/view/screen/homescreen.dart';
import 'package:clock_app/view/screen/stopwatch.dart';
import 'package:flutter/material.dart';

class timer extends StatefulWidget {
  const timer({super.key});

  @override
  State<timer> createState() => _timerState();
}

int seconds=0,minutes=0;
bool isRunning=false;

class _timerState extends State<timer> {

  Future<void> stop() async {
    await Future.delayed(const Duration(seconds: 1),
            (){
          setState(() {
            if(minutes>0) {
              if (seconds == 0) {
                minutes--;
                seconds = 59;
              }
              else {
                seconds--;
              }
            }
          });
        }
    );
     if(isRunning)
       stop();
  }


  @override
  Widget build(BuildContext context) {
    String digitalseconds = seconds.toString().padLeft(2, '0');
    String digitalminutes = minutes.toString().padLeft(2, '0');


    return Scaffold(
      backgroundColor: const Color(0xff132561),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200.0),
                  child: Text(
                    'Stopwatch',
                    style: TextStyle(color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          height: 300,
                          width: 300,
                          child: CircularProgressIndicator(
                            value: (seconds)/(60),
                            strokeWidth: 10,
                            backgroundColor: Color(0xff1e3b80),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          )),
                      ...List.generate(
                          60,
                              (index) => Center(
                            child: Transform.rotate(
                              angle: index * 6 * pi / 180,
                              child: (index % 5 == 0)
                                  ? Divider(
                                indent: 315,
                                endIndent: 44,
                                thickness: 1,
                                color: Colors.grey.shade50,
                              )
                                  : Divider(
                                indent: 325,
                                endIndent: 44,
                                thickness: 1,
                                color: Colors.grey.shade50,
                              ),
                            ),
                          )),
                      Text(
                        ' $digitalminutes : $digitalseconds',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if(isRunning){
                      isRunning = false;
                    } else {
                      isRunning = true;
                      stop();
                    };
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigoAccent,
                    ),
                    child: (isRunning)?Center(child: Icon(Icons.pause,color: Colors.white,size: 30,)):Icon(Icons.arrow_right_sharp,color: Colors.white,size: 70,),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 170,
                      child: OutlinedButton(
                          onPressed: () {
                            seconds=0;
                            minutes=5;
                            setState(() {
                            });
                          },
                          child:
                          Text('5 minutes',style: TextStyle(fontSize: 20),)),
                    ),
                    SizedBox(
                      height: 50,
                      width: 170,
                      child: OutlinedButton(
                          onPressed: () {
                            seconds=0;
                            minutes=15;
                            setState(() {});
                          },
                          child: Text('15 minutes',style: TextStyle(fontSize: 20))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            // color: Color(0xff071954),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => homescreen(),
                      ));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 25,
                        color: Colors.grey.shade600,
                      ),
                      Text(
                        'Clock',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_alarm,
                      size: 25,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      'Alarm',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => stopwatch(),
                      ));
                    });
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          size: 25,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          'Stopwatch',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        )
                      ],
                    ),
                ),
                Container(
                  height: 65,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Color(0xff15264a),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.av_timer_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        'Timer',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
