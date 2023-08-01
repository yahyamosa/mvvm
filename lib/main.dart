import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/login/prestaion/view_model/login.dart';
import 'package:user/generated/l10n.dart';

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
          locale: Locale("en"),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: login(),
    ));
  }
}

