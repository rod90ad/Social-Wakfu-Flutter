import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/View/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('pt', 'BR'), // Brazil
        const Locale('fr', 'FR'), // France
        const Locale('es', 'ES'), // Espain
      ],
      locale: Locale('en','US'),
      home: BlocProvider(
        bloc: ItemBloc(context),
        child: Login(),
      ),
      title: "Social Wakfu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0,206,209,1),
        primaryColorDark: Color.fromRGBO(32,178,170,1),
        accentColor: Color.fromRGBO(255,255,255,1),
      ),
    );
  }
}

