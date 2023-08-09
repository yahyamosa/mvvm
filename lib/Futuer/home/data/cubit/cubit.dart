import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/Futuer/home/data/model/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:user/hiveclass.dart';

import '../model/searchuser/searchuser.dart';

class mycubit extends Cubit<state>{
  mycubit() : super(init()) ;

  List<User> mylist = [] ;
  List<dynamic> data = [] ;

  Future<List<User>> getdata()async{
    emit(lod());
    http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
     if(response.statusCode == 200){
       data = jsonDecode(response.body);
       for(int i = 0 ;  i < data.length ; i++){
         mylist.add(User.fromJson(data[i]));
         emit(secess());
       }
     }


emit(secess());
    return mylist;


  }

  bool lang = false ;
  bool them = false;

void changlang(){
    lang = !lang;
    emit(secesslang());
}
void changthem(){
    them = !them;
    emit(secessthem());
  }

  List<dynamic> dataid = [] ;
  List<Searchuser> mydataid = [] ;

Future<List<Searchuser>> getid({required int id})async{
  http.Response  response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=${id}"));
     dataid = jsonDecode(response.body);
     for(int i = 0 ; i < dataid.length ; i++){
       mydataid.add(Searchuser.fromJson(dataid[i]));
     }
    emit(secessid(mydataid));
    return mydataid ;
}




List<myhive> myhivelist =[];
showData()async{
  var mybox = Hive.box<myhive>("mybox");
myhivelist =   mybox.values.toList();
emit(secessshow()) ;
}

addData(myhive objhive)async{
    try
    {
      var mybox = Hive.box<myhive>("mybox");
      mybox.add(objhive);
      print('good');
      emit(secessadd()) ;
    }
    catch(e){
      print(e.toString());
    }
  }

int i = 0 ;

void increcindex(){
  if(i < 2){
    i++ ;
    emit(increc());
  }
}

  void decresindex(){
   if(i > 0){
     i-- ;
     emit(decres());
   }
  }
}