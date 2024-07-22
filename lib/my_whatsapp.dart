import 'package:flutter/material.dart';
import 'chat.dart';
import '../../constants.dart';
class my_whatsapp extends StatelessWidget {
  const my_whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Chats> chatList =
    jsonList.map((e) => Chats.fromJson(e)).toList();
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
      padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _specifiChats(icon: Icons.lock , text: "Locked Chats"),
            SizedBox(width: 10,),
            _specifiChats(icon: Icons.archive , text: "Archived Chats"),
            SizedBox(width: 10,),
            
            ListView.separated(
              shrinkWrap: true,
                itemBuilder: (context , index )=> _buildChats(
                    name: chatList[index].name!,
                    image: chatList[index].image!,
                    message: chatList[index].message!,
                    createdAt: chatList[index].createdAt!
                ),
                separatorBuilder: (context , index)=> Divider(color: Colors.grey.withOpacity(.2)),
                itemCount: chatList.length
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.messenger,
          color: Colors.white,
        ),
      ),
    );
  }

  }
 AppBar _appBar(){
  return AppBar(
    elevation: 5 ,
    backgroundColor: Colors.green,
    title: Text("WhatsApp",style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),),
    actions: [
      _setIcons(Icons.camera_alt_outlined),
      _setIcons(Icons.search),
      _setIcons(Icons.more_vert),
    ],
  );
 }
 Widget _setIcons(IconData icon){
return Row(
  children: [
    Icon(icon , color: Colors.white,),
    SizedBox(width: 20,),
  ],
);
 }
 Widget _specifiChats({
   IconData? icon,
   String? text,
   bool isCountAvilable = false,
 }){
  return Row(
    children: [
      Icon(icon, color: Colors.green,),
      SizedBox(width: 20,),
      Text(text!, style: TextStyle(color: Colors.black),),
Spacer(),
if (isCountAvilable) Text("1")
  ],
  );
 }
 Widget _buildChats({
  required String name,
   required String image,
   required String message,
   required String createdAt,
}){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(image),
      ),
      SizedBox(width: 20,),
      Padding(
          padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: TextStyle(fontSize:20 ,fontWeight: FontWeight.bold),),
            SizedBox(width: 20,),
            Text(message,style: TextStyle(color: Colors.grey),),
            Spacer(),
            Text(createdAt,style: TextStyle(color: Colors.grey),),
          ],
        ),
          )
    ],
  );
 }
List<Map> jsonList = [
  {
    "id": 1,
    "name": "Ahmed",
    "message": "Hello ",
    "image": imageList[0],
    "createdAt": "9:30 AM",
    "status": "recieved"
  },
  {
    "id": 2,
    "name": "Mohmed",
    "message": "Welcome ",
    "image": imageList[1],
    "createdAt": "8:30 AM",
    "status": "read"
  },
  {
    "id": 3,
    "name": "saad",
    "message": "avilable",
    "image": imageList[2],
    "createdAt": "5:30 AM",
    "status": "read_recieved"
  },
  {
    "id": 4,
    "name": "Ahmed",
    "message": "Hello From",
    "image": imageList[3],
    "createdAt": "9:30 AM",
    "status": "read_recieved"
  },
  {
    "id": 5,
    "name": "moaz",
    "message": "avilable",
    "image": imageList[4],
    "createdAt": "3:30 AM",
    "status": "thank you"
  },
  {
    "id": 6,
    "name": "ali",
    "message": "avilable",
    "image": imageList[5],
    "createdAt": "1:30 AM",
    "status": "unread"
  },
];