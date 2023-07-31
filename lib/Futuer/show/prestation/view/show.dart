import 'package:flutter/material.dart';
import 'package:user/Futuer/home/data/model/user/user.dart';

class show extends StatefulWidget {
   show({required this.user , super.key});
User user ;
  @override
  State<show> createState() => _showState();
}

class _showState extends State<show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER :  ${widget.user.id}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('id :  ${widget.user.id}'),
            SizedBox(height: 20,),
            Container(width: MediaQuery.of(context).size.width , height: 2,color: Colors.black,) ,
            SizedBox(height: 20,),
            Text('body : ${widget.user.body}'),
            SizedBox(height: 20,),
            Container(width: MediaQuery.of(context).size.width , height: 2,color: Colors.black,) ,
            SizedBox(height: 20,),
            Text('title : ${widget.user.title}'),
            SizedBox(height: 20,),
            Container(width: MediaQuery.of(context).size.width , height: 2,color: Colors.black,) ,
            SizedBox(height: 20,),
            Text('userId : ${widget.user.userId}'),
          ],
        ),
      ),
    );
  }
}
