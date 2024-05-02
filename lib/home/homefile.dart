import 'dart:async';

import 'package:digital_clock/utils/image.dart';
import 'package:flutter/material.dart';

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
      });
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            // color: Colors.cyan,
            image: DecorationImage(
                image: (boolck == true) ? beck1 : beck2, fit: BoxFit.cover)),
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
              height: 280,
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
                )
              ]),
            ),
            Text(
              '${weekList[datetime.weekday - 1]}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
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
                  )),
                )),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
