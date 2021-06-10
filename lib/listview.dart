import 'package:flutter/material.dart';
import 'userlist.dart';

class GayathriListView extends StatelessWidget {
  List <User> list=[
    User("Music", "images/music.png",""),
    User("Food","images/food.png",""),
    User("Dance ", "images/singing.png",""),
    User("Books","images/books.png",""),
    User("MakeOver", "images/makeover.png",""),
    User("Singing","images/singing.png",""),
    User("Trending","images/trending.png",""),
    User("Politics", "images/politics.png",""),
    User("Videos ", "images/videos.png",""),
    User("Psycology", "images/psycology.png",""),
    User("Workout", "images/workouts.png",""),
    User("Nature", "images/nature.png",""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index)=>new Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('images/person.png'),
                  ),
                  SizedBox(width: 10,),
                  Padding(padding: EdgeInsets.only(right: 230),
                    child: Text(list[index].userName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(list[index].dp,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:  Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right:0, left: 20 ),
                    child: Icon(Icons.favorite_border_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.messenger_outline),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
