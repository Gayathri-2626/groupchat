import 'package:flutter/material.dart';
import 'package:groupchat/gridview.dart';
import 'package:groupchat/listview.dart';
import 'userlist.dart';

class ChatView extends StatelessWidget {
  User user;
  ChatView(User list, {this.user});
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.redAccent,
        flexibleSpace: Padding(
            padding:EdgeInsets.all(10),
            // child:Column(
            //     children: [
            //       SizedBox(height:20),
            //       Text(this.user.userName,
            //         style:
            //         TextStyle(color:Colors.white, fontSize: 22,fontWeight: FontWeight.bold),),
            //       // Expanded(
            //       //     child: Container(
            //       //         alignment:Alignment.center,
            //       //         child: Text(this.user.dp,
            //       //             style: TextStyle(
            //       //                 color: Colors.white, fontSize: 13))))
            //     ],
            // ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
// decoration:  BoxDecoration(
//   gradient: LinearGradient(
//       colors: [
//         Colors.orangeAccent,
//         Colors.pinkAccent
//       ],
//       end: Alignment.bottomCenter,
//       begin: Alignment.topCenter),),
              child: TabBar(
                controller: controller,
                indicatorColor: Colors.grey,
                labelColor: Colors.white,
                indicatorWeight: 2.0,
                unselectedLabelColor: Colors.white70,
                isScrollable: true,
                tabs: [
                  Padding(padding: EdgeInsets.only(right: 60),
                    child: Tab(icon: Icon(Icons.list,color: Colors.black,),),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30,left: 60),
                      child: Tab(icon: Icon(Icons.grid_view,color: Colors.black,),)
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      // new listview.GayathriListView(),
                      // new gridview.GayathriGridView(),
                      GayathriListView(),
                      GayathriGridView(),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
