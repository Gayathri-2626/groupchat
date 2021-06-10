import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupchat/chatscreen.dart';
import 'package:groupchat/labled_textform_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'userlist.dart';

class CreateGroup extends StatefulWidget {
  final refreshUI;
  CreateGroup(this.refreshUI);
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  TextEditingController name = TextEditingController();

  addToList(){
    User user = User(name.text, '', '');
    user.dp = _imageFile.path;

    // DateTime now = DateTime. now();
    // user.time = DateTime.now().toLocal().toString();

    DateTime now = DateTime. now();
   String formattedDate = DateFormat('dd-MM-yy'). format(now);
   user.time=formattedDate;

    // user.newvariable

    list.insert(0, user);
    Navigator.of(context).pop();
    widget.refreshUI();
  }

  bool valNotify1 = false;
  bool valNotify2 = false;
  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1=newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2=newValue2;
    });
  }
  DateTime now = DateTime. now();

  DateTime dateTime = new DateTime.now();
  DateTime dateTimeto = new DateTime.now();


  @override
  Widget build(BuildContext context) {
    String _formatteddate = new DateFormat('dd-MM-yy').format(dateTime);
    String _formatteddateto = new DateFormat.yM().format(dateTimeto);

    String formattedDate = DateFormat('dd-MM-yy'). format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Create a Group', style: TextStyle(
          color: Colors.black,
        ),),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[

              const PopupMenuItem(
                child: ListTile(
                  //leading: Icon(Icons.anchor),
                  title: Text('Delete Group'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Exit'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Report'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text('Cancel'),
                ),
              ),
              // const PopupMenuDivider(),
              //const PopupMenuItem(child: Text('Item A')),
              //const PopupMenuItem(child: Text('Item B')),
            ],
          ),
        ],
      ),
     body: Padding(
       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
       child: ListView(
         children: [
           imageProfile(),
           Center(
             child: Text('Upload Profile'),
           ),
           Padding(padding: EdgeInsets.only(top: 20, left: 5, right: 5,bottom: 17),
             child: Container(
               height: 40,
               color: Colors.grey[200],
               child: TextField(
                 controller:name,
                 cursorColor: Colors.grey,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none,
                   ),
                   fillColor: Colors.grey,
                   hintText: 'Add a Group Title',
                 ),
               ),
             )
           ),
           Padding(padding: EdgeInsets.only(top: 0,left: 5, right: 5),
             child: Container(
               height: 100,
               color: Colors.grey[200],
               child: TextField(
                 cursorColor: Colors.grey,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none,
                   ),
                   fillColor: Colors.grey,
                   hintText: 'Group Description',
                 ),
               ),
             )
           ),

           Padding(padding: EdgeInsets.only(top: 20,left: 5, right: 5),
               child: Container(
                 height: 84,
                 color: Colors.grey[150],
                 child:  LabeledTextFormField(
                   title: 'Location (optional)',
                   hintText: 'Villupuram, Tamilnadu.',
                   validator: (value){
                     if(value.isEmpty){
                       return 'Required profession';
                     }
                     return null;
                   },
                 ),

               )
           ),

           SizedBox(
             width: 5,
           ),

           Padding(padding: EdgeInsets.only(right: 175),
             child: Column(
               children: [
                 Text(dateTime == null ? 'To' : _formatteddate.toString()),
                 RaisedButton(
                   child: Text('Starts (optional)'),
                   onPressed: (){
                     showDatePicker(
                       context: context,
                       initialDate: dateTime == null ? DateTime.now()
                           : dateTime,
                       firstDate: DateTime(1990),
                       lastDate: DateTime.now(),
                     ).then((date){
                       setState(() {
                         dateTime=date;
                       });
                     });
                   },
                 )
               ],
             ),
           ),
           Divider(height: 0.7,
           thickness: 1.5,),

           SizedBox(
             height: 20,
           ),

           Padding(padding: EdgeInsets.only(right: 175),
             child: Column(
               children: [
                 Text(dateTimeto == null ? 'To' : _formatteddateto.toString()),
                 RaisedButton(
                   child: Text('Ends (optional)'),
                   onPressed: (){
                     showDatePicker(
                       context: context,
                       initialDate: dateTimeto == null ? DateTime.now()
                           : dateTimeto,
                       firstDate: DateTime(1990),
                       lastDate: DateTime.now(),
                     ).then((date){
                       setState(() {
                         dateTimeto=date;
                       });
                     });
                   },
                 )
               ],
             ),
           ),
           Divider(height: 0.7,
             thickness: 1.5,),

           SizedBox(height: 10,),


           // Padding(padding: EdgeInsets.only(top: 20,left: 5, right: 5),
           //     child: Container(
           //       height: 84,
           //       color: Colors.grey[150],
           //       child:  LabeledTextFormField(
           //         title: 'Starts (optional)',
           //         hintText: 'June 2,2021',
           //         validator: (value){
           //           if(value.isEmpty){
           //             return 'Required profession';
           //           }
           //           return null;
           //         },
           //       ),
           //
           //     )
           // ),
           // Padding(padding: EdgeInsets.only(top: 20,left: 5, right: 5),
           //     child: Container(
           //       height: 84,
           //       color: Colors.grey[150],
           //       child:  LabeledTextFormField(
           //         title: 'Ends (optional)',
           //         hintText: 'June 12,2021',
           //         validator: (value){
           //           if(value.isEmpty){
           //             return 'Required profession';
           //           }
           //           return null;
           //         },
           //       ),
           //
           //     )
           // ),
           Padding(padding: EdgeInsets.only(top: 0,left: 0, right: 0),
               child: Container(
                 child: buildNotificationOption("Allow anyone find Group", valNotify1, onChangeFunction1),
                 // height: 84,
                 // color: Colors.grey[150],
                 // child:  LabeledTextFormField(
                 //   title: 'allow anyone to finf Group',
                 //   validator: (value){
                 //     if(value.isEmpty){
                 //       return 'Required profession';
                 //     }
                 //     return null;
                 //   },
                 // ),

               ),
           ),
           Divider(height: 0.9,
           thickness: 2,),
           Padding(
             padding: EdgeInsets.only(top: 20,left: 0, right: 0),
             child: Container(
               child: buildNotificationOption("Allow photo uploads", valNotify2, onChangeFunction2),
             ),
           ),
           SizedBox(height: 10,),
           RaisedButton(
             color: Colors.white,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(0)
             ),
             padding: EdgeInsets.all(0.0),
             onPressed: (){
               addToList();
             //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
             },
             child: Ink(
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       colors: [
                         Colors.deepOrangeAccent,
                         Colors.pinkAccent
                       ],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight
                   ),
                   borderRadius: BorderRadius.circular(10)
               ),
               child: Container(
                 constraints: BoxConstraints(
                   maxWidth: 200,
                   maxHeight: 50,
                 ),
                 alignment: Alignment.center,
                 child: Text('Save'),
               ),
             ),
           )
         ],
       ),
     ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),),
          Transform.scale(scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.pink,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: _imageFile == null ? AssetImage("images/person.png")
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 15.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context, builder: ((builder)=> bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,color: Colors.black,size: 34,
              ),
            )

          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
                },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final PickedFile = await _picker.getImage(source: source,
    );
    setState(() {
      _imageFile = PickedFile;
    });
  }
}
