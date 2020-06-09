import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class worldtime
{
  String time;
  String location;
  String flag;
  String url;
  bool isdaytime;
  worldtime({this.location,this.flag,this.url});
  Future<void>getTime() async
  {
    Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data=jsonDecode(response.body);
    String datetime=data["datetime"];
    print(datetime);
    String offset=data["utc_offset"];
    print(offset);
    int h=int.parse(offset.substring(1,3));
    int m=int.parse(offset.substring(4,6));
    if(offset.substring(0,1)=='-')
    {
      h=24-h;
      h=h%24;
    }
    //print(datetime);
    //print(offset);
    DateTime now=DateTime.parse(datetime);
    ///print(now);
    now=now.add(Duration(hours:h,minutes: m));
    print(location);
    print("this is time$now");
    print(now.hour);
    isdaytime=now.hour>6&&now.hour<18?true:false;
    print(isdaytime);
    time=DateFormat.jm().format(now);
    print(time);
  }
}