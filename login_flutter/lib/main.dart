import 'package:flutter/material.dart';
import 'package:login_flutter/presenter/LoginPresenter.dart';
import 'package:login_flutter/view/LoginPage.dart';
import 'package:login_flutter/view/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(new BasicLoginButtonPresenter(), title: 'Login Flutter'),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context)=> new HomePage(),
      },
    );
  }
}