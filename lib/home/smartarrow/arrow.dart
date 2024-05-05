import 'dart:async';
import 'dart:math';

import 'package:digital_clock/utils/globle_list.dart';
import 'package:digital_clock/utils/image.dart';
import 'package:flutter/material.dart';

class SmartArrow extends StatefulWidget {
  const SmartArrow({super.key});

  @override
  State<SmartArrow> createState() => _SmartArrowState();
}

class _SmartArrowState extends State<SmartArrow> {
  @override
  Widget build(BuildContext context) {
                      // setState(() {
                      // });
    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      setState(() {
        //TODO USE NUMBER SHOW arrownum=1;
        datetime = DateTime.now();
      });
    });
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/');
        },
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
              image: DecorationImage(image: beck1, fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white10),
                    backgroundBlendMode: BlendMode.color),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(60, (index) {
                      return Transform.rotate(
                      angle: ((index+1)*12*pi)/360,
                      child: ((index+1)%5==0)?Stack(
                        children: [
                          const VerticalDivider(
                            endIndent: 285,
                            color: Colors.cyanAccent,
                          ),
                          //TODO USE NUMBER SHOW (arrownum<=9)?Text('0${arrownum++}',style: const TextStyle(color: Colors.red,height: 3.5,fontSize: 17,),):
                          // Text((arrownum++).toString(),style: const TextStyle(color: Colors.red,height:3.5,fontSize: 17,),),
                        ],
                      ):
                      const VerticalDivider(
                        endIndent: 290,
                        color: Colors.white,
                      ),
                    );
                }
                  ),
                    Transform.rotate(
                      angle: (((datetime.hour%12)+datetime.minute/60)*30*pi)/180,
                      child: const VerticalDivider(
                        color: Colors.orangeAccent,
                        thickness: 3,
                        endIndent: 150,
                        indent: 73,
                      ),
                    ),
                    Transform.rotate(
                      angle: (datetime.minute*6*pi)/180,
                      child: const VerticalDivider(
                        color: Colors.cyan,
                        thickness: 3,
                        endIndent: 150,
                        indent: 55,
                      ),
                    ),
                    Transform.rotate(
                      angle: (datetime.second * 6 * pi) / 180,
                      child: const VerticalDivider(
                        color: Colors.red,
                        endIndent: 150,
                        indent: 45,
                        thickness: 3,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle
                      ),
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
