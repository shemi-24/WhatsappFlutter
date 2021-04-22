import 'dart:ffi';

import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
import 'package:flutter/services.dart';
class PersonalScreen extends StatefulWidget {


  final ChatModel chatModel1;
  PersonalScreen(@ required this.chatModel1,);

  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}


class _PersonalScreenState extends State<PersonalScreen> {

  bool show=false;
  bool _isSelected=false;
  FocusNode focusNode=FocusNode();
  TextEditingController _controller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
    if(focusNode.hasFocus){
      setState(() {
        show=false;
      });
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: ScreenUtil().setWidth(90),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){Navigator.pop(context);},
              child: Icon(
                Icons.arrow_back,size: ScreenUtil().setWidth(24),
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(8),),
            CircleAvatar(
              radius: ScreenUtil().setWidth(27),
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(widget.chatModel1.icon,color: Colors.white,height: ScreenUtil().setHeight(37),width: ScreenUtil().setWidth(37),),
            )
          ],
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatModel1.name,style: TextStyle(fontSize: ScreenUtil().setSp(22),fontWeight: FontWeight.bold),),
            Text("Last seen today at 12:05pm",style: TextStyle(fontSize: ScreenUtil().setSp(13),fontWeight: FontWeight.normal),)
          ],
        ),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.video,size: ScreenUtil().setWidth(24),), onPressed: (){}),
          IconButton(icon: Icon(Icons.call,size: ScreenUtil().setWidth(24)), onPressed: (){}),
          // IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
          PopupMenuButton(itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: Text("View group"),value: "View group",),
              PopupMenuItem(child: Text("Media,links, and docs"),value: "Media,links, and docs",),
              PopupMenuItem(child: Text("Search"),value: "Search",),
              PopupMenuItem(child: Text("Mute notifications"),value: "Mute notifications",),
              PopupMenuItem(child: Text("Wallpaper"),value: "Wallpaper",),
              PopupMenuItem(child: Text("More"),value: "More",),

            ];

          },
            onSelected: (value){
              print(value);
            },
          )
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:new BoxDecoration(
            image:  new DecorationImage(
              image: new AssetImage("assets/images/bg_whatsapp.jpg"),
              fit: BoxFit.cover,)
        ),
        child: WillPopScope(

          onWillPop: () {
            if(show){
              setState(() {
                show=false;
              });
            } else{
              // ignore: missing_return
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width-50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              onChanged: (value){
                                print(value);
                                setState(() {
                                  if(value.isNotEmpty)
                                  _isSelected=true;
                                });
                              },
                              focusNode: focusNode,
                              maxLines: 5,
                              minLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                contentPadding: EdgeInsets.all(5),
                                prefixIcon: IconButton(icon: Icon(Icons.emoji_emotions_outlined),onPressed: (){setState(() {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus=false;
                                  show=!show;
                                });},),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(icon: Icon(Icons.attach_file_sharp), onPressed: (){}),
                                    IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),

                                  ],
                                )
                              ),
                            ),
                          ),

                        ),

                        CircleAvatar(
                          backgroundColor: Color(0xff128c7e),
                          radius: ScreenUtil().setWidth(24),
                          child:!_isSelected?IconButton(
                            icon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: (){},
                          ):IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            onPressed: (){},
                          )
                        )
                      ],
                    ),
                      show==true?emojiSelect():Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }


  Widget emojiSelect(){
    return EmojiPicker(
      rows: 4,
        columns: 7,
        onEmojiSelected: (emoji,category){

        setState(() {
          _controller.text=_controller.text+emoji.emoji;
        });

    });
  }


}



