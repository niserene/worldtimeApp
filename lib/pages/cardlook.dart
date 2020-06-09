import 'package:flutter/material.dart';

class cardlook extends StatelessWidget {
  @override
  String flag;
  String location;
  cardlook({this.location,this.flag});
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("$flag"),
            radius: 30,
          ),
         Column(
           children: <Widget>[
             Text("$location",style:
               TextStyle(fontSize: 20,letterSpacing: 2,color: Colors.grey[900]),),
             IconButton(
               onPressed: (){},icon:Icon(Icons.arrow_forward),
               color: Colors.green,
             )
           ],
         )
        ],
      ),
    );
  }
}
