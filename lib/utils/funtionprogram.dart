
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