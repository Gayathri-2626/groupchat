import 'package:flutter/material.dart';

import 'userlist.dart';

class GayathriGridView extends StatelessWidget {
  List <User> list=[
    User("images/music.png","",""),
    User("images/food.png","",""),
    User( "images/singing.png","",""),
    User("images/books.png","",""),
    User( "images/makeover.png","",""),
    User("images/singing.png","",""),
    User("images/trending.png","",""),
    User( "images/politics.png","",""),
    User("images/videos.png","",""),
    User( "images/psycology.png","",""),
    User( "images/workouts.png","",""),
    User( "images/nature.png","",""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 12,
        itemBuilder: (context, index){
          return Card(
            elevation: 10,
            child: Center(
              child: Image.asset(list[index].dp),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
