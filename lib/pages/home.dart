import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/loading.dart';
import "package:worldtime/pages/cardlook.dart";
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Map data={};
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print(data);
    String bgimage= data["isdaytime"]?"assets/day2.jpg":"assets/night.jpg";

    return Scaffold(
     body:SafeArea(
       child: Container(
          decoration:BoxDecoration(
           image:DecorationImage(
             image: AssetImage(bgimage),
             fit: BoxFit.cover,
           )
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             FlatButton.icon(
               onPressed: ()async{
                 dynamic result=await Navigator.pushNamed(context,"/choose_location");
                 //print(result);
                 data["location"]=result["location"];
                 data["time"]=result["time"];
                 data["isdaytime"]=result["isdaytime"];
                 setState(()
                 {

                 });
               },
               icon: Icon(Icons.add_location),
               label: Text("Edit Location",style: TextStyle(fontSize:25,fontWeight:FontWeight.bold,color:Colors.grey[900]),),
             ),
             SizedBox(height: 20),
             Row(
               children: <Widget>[
                 SizedBox(width: 100,),
                 Text(data["location"],style: TextStyle(
                   fontWeight: FontWeight.bold,fontSize: 40,color: Colors.grey[900]
                 ),),
               ],
             ),
             SizedBox(height: 20,),
             Row(
               children: <Widget>[
                 SizedBox(width: 80,),
                 Text(data["time"],style: TextStyle(
                     fontWeight: FontWeight.bold,fontSize: 60,color: Colors.grey[900]
                 ),),
               ],
             )
           ],
         ),
       ),
       ),
     );
  }
}
