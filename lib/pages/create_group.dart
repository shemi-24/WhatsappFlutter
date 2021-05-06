import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/custom_ui/AvatarCard.dart';
import 'package:whatsapp_flutter/custom_ui/contact_card.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> chats=[


    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"How are you"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"HI man"),
    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"How are you"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"HI man"),
    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"How are you"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"HI man"),
    ChatModel(name:"Shemeer", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"hi da"),
    ChatModel(name:"fazil", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"How are you"),
    ChatModel(name:"Krishnadas", icon:"assets/svgs/person.svg", isSelected:false, currentMessage:"HI man"),



  ];

  List<ChatModel> groups=[];

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
      Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder:
                (BuildContext context, int index) {
              if(index==0){
                return Container(
                  height: groups.length>0?90:10,
                );
              }
              return InkWell(child: ContactCard(chats[index-1]),onTap: (){
                if(chats[index-1].isSelected==false){
                  setState(() {
                    chats[index-1].isSelected=true;
                    groups.add(chats[index-1]);
                  });
                } else{
                  setState(() {
                    chats[index-1].isSelected=false;
                    groups.add(chats[index-1]);
                  });
                }
              },);
            },
            itemCount: chats.length+1,
          ),
          groups.length>0?Column(

            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(

                  itemCount: chats.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context,int index){
                    if(chats[index].isSelected==true){
                      return InkWell(child: AvatarCard(chats[index]),onTap: (){print("tapped");setState(() {
                        groups.remove(chats[index]);chats[index].isSelected=false;
                      });},);
                    } else{
                      return Container();
                    }
                  }

                ),
              ),
              Divider(thickness: 1,)
            ],
          ):Container()
        ],
      ),
    );
  }
}
