class GroupCreateChatModel{
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  bool isSelected=false;

  GroupCreateChatModel(this.name, this.icon, this.isGroup, this.time, this.currentMessage);
}