import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/presantion/view/home.dart';

void main() {
  runApp(const app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
      BlocProvider(create:(context)=>mycubit()),
    ],
        child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    ));
  }
}

