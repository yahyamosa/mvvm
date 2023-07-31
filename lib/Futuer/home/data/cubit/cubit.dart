import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
import 'package:user/Futuer/home/data/model/user/user.dart';
import 'package:http/http.dart' as http;

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





}