import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/custom_ui/custome_card.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chats=[

    ChatModel("Skyewall", "assets/svgs/groups.svg", true, "20:02", "HI all"),
    ChatModel("Shemeer", "assets/svgs/person.svg", false, "19:02", "hi da"),
    ChatModel("fazil", "assets/svgs/person.svg", false, "19:02", "How are you"),
    ChatModel("friends", "assets/svgs/groups.svg", true, "17:09", "HI all"),
    ChatModel("Good", "assets/svgs/groups.svg", true, "16:02", "HI all"),
    ChatModel("Krishnadas", "assets/svgs/person.svg", false, "13:02", "HI man"),
    // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),
    // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),

  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) { return CustomCard(chats[index]);},
      itemCount: chats.length,


      // children: [
      //   CustomCard(),
      //   Divider(thickness: ScreenUtil().setWidth(2.5),indent: ScreenUtil().setWidth(45),endIndent: ScreenUtil().setWidth(20),),
      //   CustomCard(),
      // ],
    );
  }
}
