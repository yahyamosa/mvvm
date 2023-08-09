import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/hiveclass.dart';
import 'package:user/list.dart';

import '../../../../generated/l10n.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
TextEditingController cont1 = TextEditingController();
TextEditingController cont2 = TextEditingController();

class _loginState extends State<login> {
  @override
  void initState() {
  BlocProvider.of<mycubit>(context).showData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return BlocBuilder<mycubit,state>(
      builder: (context , stat) {
        var mod = BlocProvider.of<mycubit>(context).them;

        List<myhive> mylisthive = BlocProvider.of<mycubit>(context).myhivelist;

        int i = BlocProvider.of<mycubit>(context).i;

        return Scaffold(
          appBar:AppBar(
            elevation: 0,
            title: Text('log in'),
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
                  Expanded(
                    child: Stepper(
                      elevation: 0,

                      currentStep:i,

                      onStepCancel:(){
                      BlocProvider.of<mycubit>(context).decresindex();
                      print(i);
                      },

                      onStepContinue:(){
                      BlocProvider.of<mycubit>(context).increcindex();
                      print(i);
                      },
                      steps: [
                        Step(title: Text('log in'), content: Container() ,isActive: i>=0),
                        Step(title: Text('log in'), content: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Log IN') ,
                              SizedBox(height: 30,),
                              Container(
                                width:MediaQuery.of(context).size.width * 8,
                                child: TextFormField(
                                  decoration:InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width:MediaQuery.of(context).size.width * 8,
                                child: TextFormField(
                                  decoration:InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                  color: Colors.blue,
                                  width: MediaQuery.of(context).size.width * 7 ,
                                  child: MaterialButton(onPressed:(){} , child: Text('LogIN'),))
                            ],
                          ),
                        ) ,isActive: i>=1),
                        Step(title: Text('log in'), content: Container() ,isActive: i>=2)
                      ],
                      type: StepperType.horizontal
                    ),
                  ),
                  Text(S.of(context).title , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: cont1,
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
                    controller: cont2,
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
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>mylist()));
                     //   String age = cont2.text.toString();
                      //  myhive h = myhive(name:cont1.text.toString() , age: 10) ;
                     //   print(mylisthive.length);
                      //  BlocProvider.of<mycubit>(context).addData(h);
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
