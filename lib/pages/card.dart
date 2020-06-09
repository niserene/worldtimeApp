
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/pages/worldtime.dart';

class card extends StatefulWidget {
  String flag;
  String location;
  String url;

  card({this.flag,this.location,this.url});

  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  bool isdaytime;
  String time;

  void getupdate()async
  {
      worldtime instance=worldtime(location: widget.location,url: widget.url,flag: widget.flag);
      await instance.getTime();
      time=instance.time;
      isdaytime=instance.isdaytime;
      print("card $isdaytime");
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(widget.flag),
              radius:20,
            ),
            SizedBox(width: 30,),
            Text(widget.location,style:
              TextStyle(fontSize:15,color: Colors.grey[800],letterSpacing: 2.0,fontWeight: FontWeight.bold),),
            SizedBox(width: 30,),
            IconButton(
              onPressed:()async{
                await getupdate();
                Navigator.pop(context,{
                  "location":widget.location,
                   "time":time,
                  "isdaytime":isdaytime,}
                );},
              icon: Icon(Icons.arrow_forward,color: Colors.green,),
            )
          ],
        ),
      ),
    );
  }
}
