import 'package:flutter/material.dart';
import 'package:login_flutter/model/LoginModel.dart';
import 'package:login_flutter/presenter/LoginPresenter.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final LoginButtonPresenter loginButtonPresenter;

  LoginPage(this.loginButtonPresenter, {this.title, Key key}) : super(key: key); 

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewPresenter {

  LoginModel _loginModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Username", style: TextStyle(fontSize: 18.0),),
                    TextField(
                      controller: _loginModel.user,
                      decoration: InputDecoration(
                        hintText: 'Username'
                      ),
                    ),
                    Text("Password", style: TextStyle(fontSize: 18.0),),
                    TextField(
                      controller:_loginModel.pass,
                      obscureText:true,
                      decoration: InputDecoration(
                        hintText: 'Password'
                      ),
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: ()=>this.widget.loginButtonPresenter.buttonClick(),
                    ),
                    Text(_loginModel.msg, style: TextStyle(fontSize: 18.0),),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void refreshData(LoginModel model) {
    setState(() {
      this._loginModel=model;
    });
  }

  @override
  void initState() { 
    super.initState();
    this.widget.loginButtonPresenter.view=this;
  }

}

class LoginViewPresenter {
  void refreshData(LoginModel model){}
  
}