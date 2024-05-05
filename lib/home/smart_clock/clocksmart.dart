import 'dart:async';

import 'package:digital_clock/utils/globle_list.dart';
import 'package:digital_clock/utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmartClock extends StatefulWidget {
  const SmartClock({super.key});

  @override
  State<SmartClock> createState() => _SmartClockState();
}

class _SmartClockState extends State<SmartClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
          });
        },
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            image: DecorationImage(image: beck1, fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 290,
                width: 290,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        value: datetime.second / 60,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 282,
                      width: 282,
                      child: CircularProgressIndicator(
                        value: datetime.minute / 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 273.5,
                      width: 273.5,
                      child: CircularProgressIndicator(
                        value:
                            ((datetime.hour % 12) + datetime.minute / 60) / 12,
                        color: Colors.green,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: (datetime.day <= 9)
                                    ? '0${datetime.day}'
                                    : datetime.day.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const TextSpan(
                                text: '/',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              TextSpan(
                                text: (datetime.month <= 9)
                                    ? '0${datetime.month}'
                                    : datetime.month.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const TextSpan(
                                text: '/',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              TextSpan(
                                text: datetime.year.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: (datetime.hour % 12 != 0)
                                    ? ((datetime.hour % 12) <= 9)
                                        ? '0${datetime.hour % 12}'
                                        : (datetime.hour % 12).toString()
                                    : '12',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              const TextSpan(
                                text: ':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              TextSpan(
                                text: (datetime.minute <= 9)
                                    ? '0${datetime.minute}'
                                    : (datetime.minute).toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              const TextSpan(
                                text: '.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              TextSpan(
                                text: (datetime.second <= 9)
                                    ? '0${datetime.second}'
                                    : datetime.second.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          weekList[datetime.weekday - 1],
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          (datetime.hour>=12)?pm:am,
                          style: const TextStyle(
                              fontSize: 35, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
