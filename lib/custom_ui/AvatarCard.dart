import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_flutter/models/chat_model.dart';
class AvatarCard extends StatelessWidget {

  ChatModel chatModel;
  AvatarCard(this.chatModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: SvgPicture.asset(chatModel.icon,color: Colors.white,height: ScreenUtil().setHeight(37),width: ScreenUtil().setWidth(37),),
                backgroundColor: Colors.blueGrey,
              ),
              chatModel.isSelected?Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.close,color: Colors.white,size: ScreenUtil().setWidth(18),
                  ),
                ),
              ):Container(),
            ],

          ),
          SizedBox(height: 4,),
          Text(chatModel.name,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
