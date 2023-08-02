import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/Futuer/home/data/model/searchuser/searchuser.dart';

class cearch extends StatefulWidget {
  const cearch({super.key});

  @override
  State<cearch> createState() => _cearchState();
}
List<Searchuser> mydata = [];

TextEditingController cont = TextEditingController();

class _cearchState extends State<cearch> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<mycubit , state>(
        builder:(context , state){

      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 20 , right: 20 , top: 40 ),
          child: Column(
            children: [
              TextFormField(
                controller: cont,
                onFieldSubmitted:(value){
                  mydata.clear();
                  BlocProvider.of<mycubit>(context).getid(id : int.tryParse(value) as int);

                },
                decoration: InputDecoration(
                    label: Text('search'),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)
                    )
                ),
              ) ,
         Expanded(
           child: ListView.builder(
             padding: EdgeInsets.zero,
             itemCount: mydata.length,
               itemBuilder: (context , indext){
             return  Padding(
               padding: const EdgeInsets.symmetric( vertical: 20),
               child: Row(
                 children: [
                   CircleAvatar(
                     radius: 25,
                     child: Text('${mydata[indext].postId}' , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                   ) ,
                   const SizedBox(width: 10,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Container(
                         width: 200,
                         child: Text(  overflow: TextOverflow.ellipsis ,'${mydata[indext].name}' , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18),) ,) ,
                       const SizedBox(height:5,),
                       Container(
                         width: 200,
                         child: Text(  overflow: TextOverflow.ellipsis ,'${mydata[indext].email}' , style: const TextStyle( fontSize: 12 , color: Colors.grey),) ,) ,
                     ],
                   )
                 ],
               ),
             ) ;
           }),
         )
            ],
          ),
        ),
      );
    }, listener:(context , state){
          if(state is secessid){
           mydata = state.data;
          }
    });
  }
}
