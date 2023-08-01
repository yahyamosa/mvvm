import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:user/Futuer/home/data/cubit/cubit.dart';
import 'package:user/Futuer/home/data/cubit/state.dart';
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
        child:BlocBuilder<mycubit, state>(
          builder: (context , state) {
          var lang =   BlocProvider.of<mycubit>(context).lang;
          var mod = BlocProvider.of<mycubit>(context).them;
            return MaterialApp(
              locale:lang ? Locale("ar") : Locale("en"),
              theme:mod ? ThemeData.light() : ThemeData.dark(),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,

      home: login(),
    );
          }
        ));
  }
}

