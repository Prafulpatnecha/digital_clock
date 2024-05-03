import 'dart:async';
import 'dart:math';

import 'package:digital_clock/utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/funtionprogram.dart';
import '../utils/globle_list.dart';
// import '../utils/image.dart';

class MyClock extends StatelessWidget {
  const MyClock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time();
        datetime = DateTime.now();
        // hourArrow();
      });
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            image: DecorationImage(
                image: (boolck == true) ? beck1 : beck2, fit: BoxFit.cover)
            ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                'Digital Clock',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: (hour <= 9) ? '0$hour' : hour.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const TextSpan(
                  text: ':',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: (datetime.minute <= 9)
                      ? '0${datetime.minute}'
                      : datetime.minute.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                const TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: (datetime.second <= 9)
                      ? '0${datetime.second}'
                      : datetime.second.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: ' ${(datetime.hour <= 11) ? am : pm}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ]),
            ),
            Text(
              '${weekList[datetime.weekday - 1]}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
            indent: 20,
              thickness: 10,
              height: 100,
              endIndent: 20,
              color: Colors.white38,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                // color: Colors.black,
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: Colors.white,
                //   width: 2,
                // ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            value: datetime.second/60,
                          ),
                        ),
                        SizedBox(
                          height: 292,
                          width: 292,
                          child: CircularProgressIndicator(
                            color: Colors.cyanAccent,
                            value: datetime.minute/60,
                          ),
                        ),
                  SizedBox(
                          height: 285,
                          width: 285,
                          child: CircularProgressIndicator(
                            color: Colors.yellowAccent,
                            value: (hour!=12)?((hour+datetime.minute/60)/12):(0+datetime.minute/60)/12,//todo <<<<<<<<<<<<<<<<<<<<<<<<HOUR
                          ),
                        ),
                  SizedBox(
                    height: 280,
                    width: 280,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ...List.generate(60, (index)=> Transform.rotate(
                          angle: ((index+1)*12*pi)/360,
                          child: ((index+1)%5==0)?
                          Stack(
                            children: [
                              const VerticalDivider(
                                thickness: 4,
                                  color: Colors.green,
                                indent: 0,
                                endIndent: 250,
                              ),
                              // Text(index.toString()),
                            ],
                          ):VerticalDivider(
                            thickness: 2,
                            color: Colors.white,
                            indent: 0,
                            endIndent: 260,
                          ),
                          ),),
                        Transform.rotate(//todo<<<<<<<<<<<<<<<<<<<<<<<<(HOUR Arrow)<<<<<<<<<<<<<<<<<<<<<<<<<
                          angle: ((datetime.hour+datetime.minute/60)*30*pi)/180,
                          // angle: ((arrowhour)*30*pi)/180,
                          child: const VerticalDivider(
                            width: 10,
                            color: Colors.yellow,
                            endIndent: 120,
                            thickness: 3,
                            indent: 80,
                          ),
                        ),
                        Transform.rotate(
                          angle: (datetime.minute*6*pi)/180,
                          child: const VerticalDivider(
                            width: 10,
                            color: Colors.cyanAccent,
                            endIndent: 120,
                            thickness: 3,
                            indent: 70,
                          ),
                        ),
                        Transform.rotate(
                          angle: (datetime.second*6*pi)/180,
                          child: const VerticalDivider(
                            width: 10,
                            color: Colors.red,
                            endIndent: 120,
                            thickness: 3,
                            indent: 40,
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                  if (boolck == true) {
                    boolck = false;
                  } else {
                    boolck = true;
                  }
                  });
                },
                child: const SizedBox(
                  height: 50,
                  width: 70,
                  child: Center(
                      child: Text(
                    'Clock',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),),
                ),),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
