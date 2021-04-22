import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
import 'package:whatsapp_flutter/pages/individual_user_screen.dart';


class CustomCard extends StatelessWidget {

  final ChatModel chatModel;
  CustomCard(this.chatModel);

  // _CustomCardState(this.chatModel

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalScreen(chatModel)));
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(chatModel.icon,color: Colors.white,height: ScreenUtil().setHeight(37),width: ScreenUtil().setWidth(37),),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(chatModel.name,style: TextStyle(fontSize: ScreenUtil().setSp(18),fontWeight: FontWeight.bold),),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,size: ScreenUtil().setWidth(20),color: Colors.lightBlue,
                ),
                SizedBox(width: ScreenUtil().setWidth(4),),
                Text(chatModel.currentMessage,style: TextStyle(fontSize: ScreenUtil().setSp(18)),),
              ],
            ),
            trailing: Text(chatModel.time),
          ),
        ),
          Divider(thickness: ScreenUtil().setWidth(2.5),indent: ScreenUtil().setWidth(45),endIndent: ScreenUtil().setWidth(20),),
      ],
    );
  }
}
