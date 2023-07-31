import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/Futuer/home/data/model/user/user.dart';
import 'package:user/Futuer/show/prestation/view/show.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    BlocProvider.of<mycubit>(context).getdata();
    super.initState();
  }
  Widget build(BuildContext context) {
    return BlocConsumer<mycubit , state>(
        builder:(context , state){
          List<User> mylist = BlocProvider.of<mycubit>(context).mylist;
          var list = BlocProvider.of<mycubit>(context).data;
          return Scaffold(
           body:state is lod ?const Center(child: CircularProgressIndicator()) :  ListView.builder(
             itemCount: mylist.length,
               itemBuilder:(context , indext){
             return GestureDetector(
               onTap:(){
                 User user = User(id:mylist[indext].id , body:mylist[indext].body  , title:mylist[indext].title , userId:mylist[indext].userId);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>show(user: user)));
               },
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                 child: Row(
                   children: [
                     CircleAvatar(
                       radius: 25,
                       child: Text('${mylist[indext].id}' , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                     ) ,
                    const SizedBox(width: 10,),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Container(
                           width: 200,
                             child: Text(  overflow: TextOverflow.ellipsis ,'${mylist[indext].title}' , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18),) ,) ,
                        const SizedBox(height:5,),
                         Container(
                           width: 200,
                           child: Text(  overflow: TextOverflow.ellipsis ,'${mylist[indext].body}' , style: const TextStyle( fontSize: 12 , color: Colors.grey),) ,) ,
                       ],
                     )
                   ],
                 ),
               ),
             );
           })
          );
        },
        listener:(context , state){});
  }
}
