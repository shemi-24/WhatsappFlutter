import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_flutter/pages/chat_screen.dart';
import 'package:whatsapp_flutter/pages/select_contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(414, 896),
        orientation: Orientation.portrait);

    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          // IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
          PopupMenuButton(itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(child: Text("New group"),value: "New group",),
              PopupMenuItem(child: Text("New broadcast"),value: "New broadcast",),
              PopupMenuItem(child: Text("WhatsApp Web"),value: "WhatsApp Web",),
              PopupMenuItem(child: Text("Starred messages"),value: "Starred messages",),
              PopupMenuItem(child: Text("Payments"),value: "Payments",),
              PopupMenuItem(child: Text("Settings"),value: "Settings",),

            ];

          },
            onSelected: (value){
            print(value);
            },
          )
        ],
        bottom: TabBar(
          // indicatorColor: Color(0xff128c7e),
          indicatorColor: Color(0xffffffff),
          controller: _tabController,
          tabs: [

            Tab(
              child:Icon(
                  Icons.camera_alt
              ),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("STATUS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatScreen(),
          ChatScreen(),
          Text("3rd"),
          Text("4th"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat
        ),
        onPressed: (){
          print("pressed");
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectContact()));
        },
      ),

    );
  }
}
