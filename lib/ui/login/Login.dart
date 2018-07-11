import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meizi_flutter/base/BaseState.dart';
import 'package:meizi_flutter/ui/home/Home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return LoginState();
  }
}

class LoginState extends BaseState<Login> {

  ScrollController scrollController;

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _pwdController=new TextEditingController();


  _userLogin(){

    String name= _nameController.text;
    if(name.isEmpty){
      showToast("用户名为空1");
      return;
    }
    String pwd= _pwdController.text;
    if(pwd.isEmpty){
      showToast("密码为空");
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
    //   Navigator.pop(context)
    showToast("登录ing...."+name);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("登录"),
        ),
        body: new Container(
          margin: const EdgeInsets.all(20.00),
          child: new Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(hintText: '用户名'),
                controller: _nameController,
              ),
              new TextField(
                obscureText: true,
                decoration: const InputDecoration(hintText: '密码'),
                controller: _pwdController,
              ),
              new Padding( padding: const EdgeInsets.all(20.00),
                child: new MaterialButton(
                  height: 40.0,
                  minWidth: 120.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text("登录"),
                  onPressed: _userLogin,
                  splashColor: Colors.redAccent,

                )
                  ,

              )
              ,

            ],
          ),
        ));
  }
}
