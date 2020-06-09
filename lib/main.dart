
import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main()
{
  runApp(new MaterialApp(
    routes:{
      '/': (context) => Loading(),
      '/choose_location':(context)=>choose_location(),
      '/home':(context)=>Home(),
    }
  )) ;
}
