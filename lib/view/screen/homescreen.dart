import 'dart:async';
import 'dart:math';

import 'package:clock_app/view/screen/stopwatch.dart';
import 'package:clock_app/view/screen/timer.dart';
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
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
    });
    return Scaffold(
      backgroundColor: const Color(0xff132561),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 250.0),
                  child: Text(
                    'Clock',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: 305,
                    width: 305,
                    decoration: const BoxDecoration(
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
                        decoration: const BoxDecoration(
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
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff22345E),
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    const Center(
                                        child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white12,
                                    )),
                                    Center(
                                      child: Transform.rotate(
                                        angle: datetime.minute * 6 * pi / 180,
                                        child: const VerticalDivider(
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
                                        child: const VerticalDivider(
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
                                        child: const VerticalDivider(
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    children: [
                      Text(
                        '${(datetime.hour > 12) ? ((datetime.hour%12) > 9)? datetime.hour % 12:('0${datetime.hour % 12}'): datetime.hour} : ${(datetime.minute>9)?datetime.minute:('0${datetime.minute}')} ',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          '${(datetime.hour >= 12) ? 'PM' : 'AM'}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${(datetime.day > 9)? datetime.day:('0${datetime.day}')} - ${(datetime.month>9)?datetime.month:('0${datetime.month}')} - ${datetime.year}',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15,),
                Divider(color: Colors.indigo.shade700,thickness: 1,height: 0.5,indent: 30,endIndent:30,),
                const SizedBox(height: 15,),
                Container(
                  height:70,
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                     color: const Color(0xff15264f),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text('Surat',style:TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text('${(datetime.hour > 12) ? ((datetime.hour%12) > 9)? datetime.hour % 12:('0${datetime.hour % 12}'): datetime.hour} : ${(datetime.minute>9)?datetime.minute:('0${datetime.minute}')}',style:const TextStyle(fontSize: 20,color: Colors.white) ,),
                      )
                    ],
                  ),
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
                const SizedBox(width: 1,),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xff15264a),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ]
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.schedule,size: 25,color: Colors.white,),
                      Text('Clock',style: TextStyle(color: Colors.white,fontSize: 12),)
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_alarm,size: 25,color: Colors.grey,),
                    Text('Alarm',style: TextStyle(color: Colors.grey,fontSize: 12),)
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => stopwatch(),));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_sharp,size: 25,color: Colors.grey,),
                      Text('Stopwatch',style: TextStyle(color: Colors.grey,fontSize: 12),)
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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.av_timer_rounded,size: 25,color:Colors.grey,),
                      Text('Timer',style: TextStyle(color: Colors.grey,fontSize: 12),)
                    ],
                  ),
                ),
                const SizedBox(width: 5,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
