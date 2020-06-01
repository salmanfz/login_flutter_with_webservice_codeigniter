import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_flutter/model/LoginModel.dart';
import 'package:login_flutter/view/LoginPage.dart';

class LoginButtonPresenter {
  set view(LoginViewPresenter value){}
  void buttonClick(){}
}

class BasicLoginButtonPresenter implements LoginButtonPresenter {

  LoginViewPresenter _loginViewPresenter;
  LoginModel _loginModel;

  BasicLoginButtonPresenter(){
    this._loginModel=LoginModel();
  }

  @override
  void set view(LoginViewPresenter value) {
    _loginViewPresenter=value;
    this._loginViewPresenter.refreshData(this._loginModel);
  }

  @override
  Future<void> buttonClick() async {
    final response = await http.post("http://10.0.2.2/login_flutter_with_webservice_codeigniter/webservice/api/login", body: {
      "username":_loginModel.user.text,
      "password":_loginModel.pass.text,
    },
    headers: {"API-KEY" : "UmZ4L0NZNjNiMWdXa0pHZFBrbHRqQT09"});

    var datauser = jsonDecode(response.body);
    if (datauser['status']) {
      print(datauser);
    }else{
        this._loginModel.msg = datauser['message'];
        this._loginViewPresenter.refreshData(this._loginModel);
    }
  }
}