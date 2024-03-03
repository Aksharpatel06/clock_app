import 'dart:async';
import 'dart:math';

import 'package:clock_app/view/screen/homescreen.dart';
import 'package:clock_app/view/screen/timer.dart';
import 'package:flutter/material.dart';

class stopwatch extends StatefulWidget {
  const stopwatch({super.key});

  @override
  State<stopwatch> createState() => _stopwatchState();
}

int seconds=0,hours=0,minutes=0,millsecond=0;
bool isRunning=false;

class _stopwatchState extends State<stopwatch> {

  Future<void> stop() async {
    await Future.delayed(const Duration(milliseconds: 80),
            (){
          setState(() {
            millsecond+=10;
            if (millsecond >= 100)
                  {
                    seconds++;
                    millsecond=0;
                  }

                if (seconds >= 60) {
                  minutes++;
                  seconds = 0;
                }
                if (minutes >= 60) {
                  hours++;
                  minutes = 0;
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
    String digitalhours = hours.toString().padLeft(2, '0');
    String digitalmillsecond = millsecond.toString().padLeft(2, '0');


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
                            value: seconds/60,
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
                        '$digitalhours : $digitalminutes : $digitalseconds : $digitalmillsecond',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 170,
                      child: OutlinedButton(
                          onPressed: () {
                            if(isRunning){
                              isRunning = false;
                            } else {
                              isRunning = true;
                              stop();
                            };
                            setState(() {
                            });
                          },
                          child:
                              Text('${isRunning ? 'Pause' : 'Start'}',style: TextStyle(fontSize: 20),)),
                    ),
                    SizedBox(
                      height: 50,
                      width: 170,
                      child: OutlinedButton(
                          onPressed: () {
                            millsecond=0;
                            seconds=0;
                            minutes=0;
                            hours=0;
                            setState(() {});
                          },
                          child: Text('Reset',style: TextStyle(fontSize: 20))),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        'Stopwatch',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => timer(),
                      ));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.av_timer_rounded,
                        size: 25,
                        color: Colors.grey.shade600,
                      ),
                      Text(
                        'Timer',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
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
