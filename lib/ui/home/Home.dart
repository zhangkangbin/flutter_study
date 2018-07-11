import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meizi_flutter/base/BaseState.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return HomeState();
  }
}

class HomeState extends BaseState<Home> {
  List listData = new List();
  ScrollController _scrollController = new ScrollController();
  var httpClient = new HttpClient();
  int index = 1;
  bool isPosting = true;

  Future _getData() async {

    setState(() {
      isPosting = true;
    });
    print("------------index---" + index.toString());
    var result = await httpClient
        .getUrl(Uri.parse("https://movie.douban.com/j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=10&page_start=$index"));
    var response = result.close();
    response.then((HttpClientResponse response) {
      setState(() {
        isPosting = false;
      });
      print("------------statusCode---" + response.statusCode.toString());
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).listen((contents) {
          //    Map map = JSON.decode(contents);
          if (contents.isEmpty) return;
          Map<String, dynamic> map;
          try {
            map = json.decode(contents);
          } on Exception catch (e) {
            print("------------e---" + e.toString());
          }

          if (map == null) return;

 /*         int errorCode = map["errorCode"];

          if(errorCode!=0) return;*/

           var data=  map['subjects'];
          if ( data== null) return;


          setState(() {
            index++;
            listData.addAll(data);
          });

          print(listData.length);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // items.addAll(itemList);
        _getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("豆瓣 Api"),
      ),
      body: ListView.builder(
        itemCount: listData.length+1 ,
        itemBuilder: (context, index) {

          if (index == listData.length) {
            print("--------------_buildProgressIndicator--------------");
            return _buildProgressIndicator();
          } else {
            var data = listData[index];
            return new Column(
              children: <Widget>[
             //    new Text(data["title"]),
                new Image.network(
                  data["cover"],
                  height: 300.0,
                  fit: BoxFit.fitWidth,
                ),
              ],
            );
          }
        },
        controller: _scrollController,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPosting?1.0:0.0, //透明度
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
