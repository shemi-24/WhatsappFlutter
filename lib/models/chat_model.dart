import 'package:flutter/cupertino.dart';

class ChatModel{
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  bool isSelected;

  ChatModel({
  @required this.name,  this.icon, this.isGroup, this.time,@required  this.currentMessage,this.isSelected=false,
  });
}