import 'package:flutter/material.dart';
import 'package:worldtime/pages/worldtime.dart';
import 'package:worldtime/pages/card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
    _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time="loading";
  void getworldtime() async
  {
   worldtime instance=worldtime(location: "Kolkata",flag:"",url:"Asia/Kolkata");
   await instance.getTime();
   print(instance.time);
   Navigator.pushNamed(context,"/home",arguments:{
     "location":instance.location,
     "time":instance.time,
     "isdaytime":instance.isdaytime,
   });
  }
  @override
  void initState() {
    super.initState();
    getworldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body:Center(
          child:SpinKitFadingFour(
            color: Colors.white,
            size: 50.0,
          )
      )
    );
  }
}
