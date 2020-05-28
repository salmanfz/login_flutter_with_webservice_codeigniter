
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(title: Text('Halaman Home'),),
       body: Column(
         children: <Widget>[
           Text('Hallo Admin', style: TextStyle(fontSize:20.0),),
           RaisedButton(
             child: Text("Logout"),
             onPressed: (){
               Navigator.pushReplacementNamed(context, "/MyHomePage");
             },
           )
         ],
       ),
     );
   }
}