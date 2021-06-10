import 'package:flutter/material.dart';
import 'package:groupchat/chatlist.dart';
import 'package:groupchat/chatview_page.dart';
import 'package:groupchat/creategroup.dart';
import 'package:groupchat/userlist.dart';

import "dart:io";

class ChatScreen extends StatefulWidget {
  final refreshUI;
  ChatScreen(this.refreshUI);

  @override
  _ChatScreenState createState() => _ChatScreenState();


}

List <User> list=[
  User("Gayathri", "Good Morning buddy", "11:11AM"),
  User("Kishore guru", "Can i call you?", "10:10AM"),
  User("Iyshu Akka", "Be Calm", "12:12AM"),
  User("Mohamad Aqeel", "I Need Peace", "01:05PM"),
  User("Subash", "Poi Thoongu po", "05:39PM"),
  User("Gayathri", "Mudiyala....", "07:12PM"),
  User("Kishore guru", "Enna Pandra?", "08:22PM"),
  User("Iyshu Akka", "Zandaaaaaaa", "11:11PM"),
  User("Mohamad Aqeel", "What's your problem?", "12:11AM"),
  User("Subash", "Cool Buddy", "11:11AM"),

];



class _ChatScreenState extends State<ChatScreen> {
  TextEditingController name = TextEditingController();
  addToList(){
    User user = User(name.text, '', '');
    // user.dp = _imageFile.path;

    // DateTime now = DateTime. now();
    // user.time = DateTime.now().toLocal().toString();

    // DateTime now = DateTime. now();
    // String formattedDate = DateFormat('dd-MM-yy'). format(now);
    // user.time=formattedDate;

    list.insert(0, user);
    Navigator.of(context).pop();
    widget.refreshUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Groups',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add,color: Colors.black, size: 34,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateGroup((){
                setState(() {
                  list = list;
                });
              })));

            },
          ),
          Icon(Icons.messenger_outline,color: Colors.black,),
          SizedBox(width: 15,),
          Padding(padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.notifications_none_sharp,color: Colors.black,),
          ),
        ],
      ),
      body: new ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index)=>new Column(
            children: [
              new Divider(height: 0.1,),
              new ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => ChatView(list[index])));
                },
                leading:  CircleAvatar(
                  backgroundImage: list[index].dp.contains('images/') ? AssetImage(list[index].dp) :  FileImage(File(list[index].dp)),
                ),
                title: Text(list[index].userName),
                subtitle: Text(list[index].lastMessage),
                trailing: Text(list[index].time),
              ),
            ],
          )

      ),
              );
  }
}

// child: Material(
              //   elevation: 0.0,
              //   color: Colors.grey[300],
              //   borderRadius: BorderRadius.circular(10.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //       ),
              //       fillColor: Colors.grey,
              //       hintText: 'Search',
              //       suffixIcon: Icon(Icons.search_rounded, size: 25, color: Colors.grey,)
              //     ),
              //   ),
              // ),

            // IconButton(
            //   icon: const Icon(Icons.add,color: Colors.black, size: 34,),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateGroup()));
            //     setState(() {
            //     });
            //   },
            // ),

