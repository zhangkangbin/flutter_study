import 'package:flutter/material.dart';
import 'package:meizi_flutter/base/BaseState.dart';
import 'package:meizi_flutter/ui/home/Home.dart';
import 'package:meizi_flutter/ui/login/Login.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter 学习',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _MyHomePageState();
  }
}

class _MyHomePageState extends BaseState<MyHomePage> {
  _go(int i) {

    switch(i){

      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;

    }

   // showToast("ddd" + i.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("学习记录"),
        ),
        body: new Column(
            children: <Widget>[
              new Text("多个使用场景"),
              new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new RaisedButton(onPressed:  () =>_go(0), child: Text('登录页面')),
              ),
              new RaisedButton( child: Text('列表页面'),onPressed:  () =>_go(1)),

            ],

        ));
  }
}
