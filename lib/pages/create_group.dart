import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/custom_ui/contact_card.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
class CreateGroup extends StatelessWidget {
  List<ChatModel> chats=[

    ChatModel("Skyewall", "assets/svgs/person.svg", true, "20:02", "Infromation Technology Company"),
    ChatModel("Shemeer", "assets/svgs/person.svg", false, "19:02", "Software Developer"),
    ChatModel("fazil", "assets/svgs/person.svg", false, "19:02", "Software Engineer"),
    ChatModel("Boosiri", "assets/svgs/person.svg", true, "17:09", "CEO"),
    ChatModel("Althaf", "assets/svgs/person.svg", true, "16:02", "CEO"),
    ChatModel("Krishnadas", "assets/svgs/person.svg", false, "13:02", "Android Developer"),
    ChatModel("Skyewall", "assets/svgs/person.svg", true, "20:02", "Infromation Technology Company"),
    ChatModel("Shemeer", "assets/svgs/person.svg", false, "19:02", "Software Developer"),
    ChatModel("fazil", "assets/svgs/person.svg", false, "19:02", "Software Engineer"),
    ChatModel("Boosiri", "assets/svgs/person.svg", true, "17:09", "CEO"),
    ChatModel("Althaf", "assets/svgs/person.svg", true, "16:02", "CEO"),
    ChatModel("Krishnadas", "assets/svgs/person.svg", false, "13:02", "Android Developer"),
    // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),
    // ChatModel("Skyewall", "groups.svg", true, "18:02", "HI all"),

  ];




  @override
  Widget build(BuildContext context) {

    int _noOfContacts=chats.length-2;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: ScreenUtil().setWidth(60),
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(
            Icons.arrow_back,size: ScreenUtil().setWidth(24),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",style: TextStyle(fontSize: ScreenUtil().setSp(24),fontWeight: FontWeight.bold),),
            SizedBox(height: ScreenUtil().setHeight(4),),
            Text( "Add partcipants",style: TextStyle(fontSize: ScreenUtil().setSp(16)),)
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          // IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
          PopupMenuButton(itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: Text("Invite a friend"),value: "Invite a friend",),
              PopupMenuItem(child: Text("Contacts"),value: "Contact",),
              PopupMenuItem(child: Text("Refresh"),value: "Refresh",),
              PopupMenuItem(child: Text("Help"),value: "Help",),


            ];

          },
            onSelected: (value){
              print(value);
            },
          )
        ],
      ),
      body:
      ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder:
            (BuildContext context, int index) {
          return ContactCard(chats[index]);
        },
        itemCount: chats.length,
      ),
    );
  }
}
