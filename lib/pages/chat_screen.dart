import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/custom_ui/custome_card.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chats = [

    // ChatModel(name:"Skyewall", icon:"assets/svgs/groups.svg", isGroup:true,, name: '' time:"20:02", currentMessage:"HI all"),
    // ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isGroup:false, time:"19:02", currentMessage:"hi da"),
    // ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isGroup:false, time:"19:02", currentMessage:"How are you"),
    // ChatModel(name:"friends", icon:"assets/svgs/groups.svg", isGroup:true, time:"17:09",currentMessage: "HI all"),
    // ChatModel(name:"Good", icon:"assets/svgs/groups.svg", isGroup:true, time:"16:02", currentMessage:"HI all"),
    // ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isGroup:false, time:"13:02", currentMessage:"HI man"),
    // // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),
    // // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),


    ChatModel(name: "skyewall",icon:"assets/svgs/groups.svg", isGroup:true,time:"19:02", currentMessage: "Hiall"),
    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isGroup:false, time:"19:02", currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isGroup:false, time:"19:02", currentMessage:"How are you"),
    ChatModel(name:"friends", icon:"assets/svgs/groups.svg", isGroup:true, time:"17:09",currentMessage: "HI all"),
    ChatModel(name:"Good", icon:"assets/svgs/groups.svg", isGroup:true, time:"16:02", currentMessage:"HI all"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isGroup:false, time:"13:02", currentMessage:"HI man"),
    // ChatModel(name: "skyewall",icon:"assets/svgs/groups.svg", isGroup:true,time:"19:02", currentMessage: "Hiall"),
    // ChatModel(name: "skyewall",icon:"assets/svgs/groups.svg", isGroup:true,time:"19:02", currentMessage: "Hiall"),







  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(chats[index]);
      },
      itemCount: chats.length,

    );
  }
}