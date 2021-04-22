import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
import 'package:whatsapp_flutter/models/group_create_chat_model.dart';
class ContactCard extends StatelessWidget {

  final ChatModel chatModel;
  // final GroupCreateChatModel groupCreateChatModel;

  ContactCard(this.chatModel,);



  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            child: SvgPicture.asset(chatModel.icon,color: Colors.white,height: ScreenUtil().setHeight(37),width: ScreenUtil().setWidth(37),),
            backgroundColor: Colors.blueGrey,
          ),
          !chatModel.isSelected?Positioned(
            bottom: 4,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 11,
              child: Icon(
                Icons.check,color: Colors.white,size: ScreenUtil().setWidth(18),
              ),
            ),
          ):Container()
        ],

      ),
      title: Text(chatModel.name,style: TextStyle(fontSize: ScreenUtil().setSp(20),fontWeight: FontWeight.bold),),
      subtitle:
          Text(chatModel.currentMessage,style: TextStyle(fontSize: ScreenUtil().setSp(18)),),


      // trailing: Text(chatModel.time),
    );
  }
}
