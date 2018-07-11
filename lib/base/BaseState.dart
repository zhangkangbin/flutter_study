
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>{
  showToast(String msg){

    Fluttertoast.showToast(
        msg: msg
    );
  }
}