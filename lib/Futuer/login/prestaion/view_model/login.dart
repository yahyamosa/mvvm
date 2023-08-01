import 'package:flutter/material.dart';
import 'package:user/Futuer/home/presantion/view/home.dart';

import '../../../../generated/l10n.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35 , left: 20 , right: 20),
        child: Column(
          children: [
            Text(S.of(context).title , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(S.of(context).email),
                suffixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                label: Text(S.of(context).password),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: MaterialButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>home()));
                } , child: Text(S.of(context).title),))
          ],
        ),
      ),
    );
  }
}
