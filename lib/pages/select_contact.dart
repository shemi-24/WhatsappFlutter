import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/custom_ui/contact_card.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
import 'package:whatsapp_flutter/pages/create_group.dart';
class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {

  List<ChatModel> chats=[

    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg",  currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg",  currentMessage:"How are you"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg",  currentMessage:"HI man"),

  ];



  @override
  Widget build(BuildContext context) {

    int _noOfContacts=chats.length;

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
            Text( "$_noOfContacts contacts",style: TextStyle(fontSize: ScreenUtil().setSp(16)),)
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
              if(index==0){return InkWell(child: buildRow(Icons.group,"New group"),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));},);}
              else if(index==1){return InkWell(child: buildRow(Icons.person_add, "New contact"),onTap: (){},);}
              return ContactCard(chats[index-2]);
              },
            itemCount: chats.length+2,
          ),
    );
  }

  Widget buildRow(IconData icon,String text) {
    return Padding(
      padding:EdgeInsets.only(left: ScreenUtil().setWidth(20),top: ScreenUtil().setWidth(18)),
      child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xff25d366),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(10),),
                Text(text,style: TextStyle(fontSize: ScreenUtil().setSp(20),fontWeight: FontWeight.bold),)
              ],
            ),
    );
  }
}
