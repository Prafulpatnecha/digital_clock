
// import 'dart:async';

import 'globle_list.dart';

void time()
{
  datetime=DateTime.now();
  hour=datetime.hour;
  switch(datetime.hour)
  {
    case 13:hour=1;
    break;
    case 14:hour=2;
    break;
    case 15:hour=3;
    break;
    case 16:hour=4;
    break;
    case 17:hour=5;
    break;
    case 18:hour=6;
    break;
    case 19:hour=7;
    break;
    case 20:hour=8;
    break;
    case 21:hour=9;
    break;
    case 22:hour=10;
    break;
    case 23:hour=11;
    break;
    case 0:hour=12;
    break;
  }
  // Timer.periodic(Duration(seconds: 1),(timer) {
    // print('${hour}${(datetime.hour<=11)?Am:Pm}');
    // print(dateTime.minute);
    // print(dateTime.second);
  // },);
}


// void hourArrow()
// {
//   arrowhour=datetime.hour.toDouble();
//   if(datetime.minute>=6 && datetime.minute<=12)
//     {
//       arrowhour=(datetime.hour+0.1);
//     }if(datetime.minute>=12 && datetime.minute<=18)
//     {
//       arrowhour=(datetime.hour+0.2);
//     }
//   else if(datetime.minute>18 && datetime.minute<=24)
//     {
//       arrowhour=(datetime.hour+0.3);
//     }else if(datetime.minute>24 && datetime.minute<=30)
//     {
//       arrowhour=(datetime.hour+0.4);
//     }else if(datetime.minute>30 && datetime.minute<=36)
//     {
//       arrowhour=(datetime.hour+0.5);
//     }else if(datetime.minute>36 && datetime.minute<=42)
//     {
//       arrowhour=(datetime.hour+0.6);
//     }else if(datetime.minute>42 && datetime.minute<=48)
//     {
//       arrowhour=(datetime.hour+0.7);
//     }else if(datetime.minute>48 && datetime.minute<=54)
//     {
//       arrowhour=(datetime.hour+0.8);
//     }else if(datetime.minute>54 && datetime.minute<=59)
//     {
//       arrowhour=(datetime.hour+0.9);
//     }
//   // switch(datetime.minute)
//   //     {
//   //   case 15:
//   // }
//   // print(arrowhour);
// }