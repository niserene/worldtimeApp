import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/pages/cardlook.dart';
import 'package:worldtime/pages/worldtime.dart';
import 'package:worldtime/pages/card.dart';

class choose_location extends StatefulWidget {
  @override
  _choose_locationState createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  @override

  List<worldtime>list=[
    worldtime(location:"London/UK",url: "Europe/London",flag: "assets/london.png"),
    worldtime(location:"Berlin/Germany",url: "Europe/Berlin",flag: "assets/berlin.png"),
    worldtime(location:"New_York/USA",url: "America/New_York",flag: "assets/newyork.png"),
    worldtime(location:"Dubai/UAE",url: "Asia/Dubai",flag: "assets/dubai.png"),
    worldtime(location:"Kolkata/India",url: "Asia/Kolkata",flag: "assets/kolkata.png"),
    worldtime(location: "Kathmandu/Nepal",url:"Asia/Kathmandu",flag:"assets/kathmandu.png"),
    worldtime(location: "Tokyo/Japan",url:"Asia/Tokyo",flag: "assets/tokyo.png"),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose the Location"),
        backgroundColor: Colors.blue[700],
        elevation:0,
      ),
      body:Column(
        children: list.map((cards){
          return card(flag: cards.flag,location: cards.location,url: cards.url,);
        }).toList(),
      )
    );
  }
}
