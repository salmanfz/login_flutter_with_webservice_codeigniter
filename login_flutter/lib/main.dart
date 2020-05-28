import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_flutter/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login'),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context)=> new HomePage(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String msg = ' ';
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  Future<List> _login() async{
    final response = await http.post("http://10.0.2.2/login_flutter_with_webservice_codeigniter/webservice/api/login", body: {
      "username":user.text,
      "password":pass.text,
    },
    headers: {"API-KEY" : "UmZ4L0NZNjNiMWdXa0pHZFBrbHRqQT09"});

    var datauser = jsonDecode(response.body);
    if (datauser['status']) {
      Navigator.pushReplacementNamed(context, "/HomePage");
    }else{
      setState(() {
        msg=datauser['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text("Username", style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller: user,
                    decoration: InputDecoration(
                      hintText: 'Username'
                    ),
                  ),
                  Text("Password", style: TextStyle(fontSize: 18.0),),
                  TextField(
                    controller:pass,
                    obscureText:true,
                    decoration: InputDecoration(
                      hintText: 'Password'
                    ),
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: (){
                      _login();
                    },
                  ),
                  Text(["", null, false, 0].contains(msg)?'':msg, style: TextStyle(fontSize: 18.0, color: Colors.red),)
            ],),
        ),
      ),
    );
  }
}
