import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/Futuer/home/data/model/searchuser/searchuser.dart';
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
    return BlocBuilder<mycubit,state>(
      builder: (context , stat) {
        var mod = BlocProvider.of<mycubit>(context).them;
        return Scaffold(
          appBar:AppBar(
            elevation: 0,
            title: Text('log in app '),
            actions: [
              IconButton(onPressed:(){
                BlocProvider.of<mycubit>(context).changthem();
              }, icon:mod ?Icon(Icons.dark_mode_rounded) :  Icon(Icons.light_mode)),
              IconButton(onPressed:(){
                BlocProvider.of<mycubit>(context).changlang();
              }, icon: Icon(Icons.language)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 35 , left: 20 , right: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).title , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
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
          ),
        );
      }
    );
  }
}
