import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

DateTime datetime = DateTime.now();

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: Color(0xff152552),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 180.0),
                //       child: Text(
                //         'Edit',
                //         style: TextStyle(
                //             color: Colors.blue.shade700,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //     Icon(
                //       Icons.add,
                //       color: Colors.white,
                //       size: 30,
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240.0),
                  child: Text(
                    'Clock',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 305,
                    width: 305,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff15264f),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ]),
                    child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff15264f),
                        ),
                        child: Stack(
                          children: [
                            ...List.generate(
                                60,
                                (index) => Center(
                                      child: Transform.rotate(
                                        angle: index * 6 * pi / 180,
                                        child: (index % 5 == 0)
                                            ? Divider(
                                                indent: 285,
                                                endIndent: 13,
                                                thickness: 1,
                                                color: Colors.grey.shade50,
                                              )
                                            : Divider(
                                                indent: 290,
                                                endIndent: 13,
                                                thickness: 1,
                                                color: Colors.grey.shade50,
                                              ),
                                      ),
                                    )),
                            Center(
                              child: Container(
                                height: 250,
                                width: 250,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff22345E),
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Center(
                                        child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white12,
                                    )),
                                    Center(
                                      child: Transform.rotate(
                                        angle: datetime.minute * 6 * pi / 180,
                                        child: VerticalDivider(
                                          color: Colors.white,
                                          thickness: 4,
                                          indent: 40,
                                          endIndent: 110,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Transform.rotate(
                                        angle: (datetime.hour * (30) * pi / 180) +
                                            ((6 * pi / 180) * (datetime.minute / 12)),
                                        child: VerticalDivider(
                                          color: Colors.white,
                                          thickness: 5,
                                          indent: 70,
                                          endIndent: 110,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Transform.rotate(
                                        angle: datetime.second * 6 * pi / 180,
                                        child: VerticalDivider(
                                          color: Colors.red,
                                          thickness: 3,
                                          indent: 25,
                                          endIndent: 110,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Surat',
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${(datetime.hour > 12) ? (datetime.hour >= 9)?(datetime.hour % 12) :datetime.hour: datetime.hour} : ${datetime.minute} ${(datetime.hour >= 12) ? 'PM' : 'AM'}',
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            color: Color(0xff071954),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.schedule,size: 25,color: Colors.white,),
                    Text('Clock',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.access_alarm,size: 25,color: Colors.white,),
                    Text('Alarm',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.timer_sharp,size: 25,color: Colors.white,),
                    Text('Stopwatch',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.av_timer_rounded,size: 25,color: Colors.white,),
                    Text('Timer',style: TextStyle(color: Colors.white,fontSize: 12),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
