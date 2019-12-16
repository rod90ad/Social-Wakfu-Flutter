import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Locale/localization.dart';
import 'package:social_wakfu/View/HomePage.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //ItemBloc
    ItemBloc bloc = BlocProvider.of<ItemBloc>(context);

    //Localization
    MyLocalizations myLocations = MyLocalizations(Locale('en','US'));
    //print("LocaleCode: ${myLocations.locale.languageCode}");

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_bg.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: StreamBuilder<Map<String,dynamic>>(
          stream: bloc.loadingState,
          builder: (context, snapshot){
            if(snapshot.hasData){
              if(snapshot.data["loading"] && !snapshot.data["updating"]){ //esta dando loading mas não esta fazendo update
                return Center(child: CircularProgressIndicator());
              }else if(snapshot.data["loading"] && snapshot.data["updating"]){ //esta fazendo update portanto carregando
                return AlertDialog(
                  title: Text(myLocations.update),
                  content: Container(
                    height: 80,
                    child: StreamBuilder<Map<String,dynamic>>(
                      stream: bloc.progressUpdate,
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Column(
                            children: <Widget>[
                              Text(snapshot.data["label"]!=null ? snapshot.data["label"] : "Updating Database"),
                              Text("${snapshot.data["atual"]}/${snapshot.data["total"]}"),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 128,
                                animation: false,
                                lineHeight: 20.0,
                                percent: snapshot.data["percent"],
                                center: Text("${(snapshot.data["percent"]*100).toStringAsFixed(1)}%"),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.greenAccent,
                              )
                            ],
                          );
                        }else{
                          return Container();
                        }
                      },
                    ),
                  ),
                );
              }else if(!snapshot.data["loading"] && !snapshot.data["updating"]){ //não esta fazendo loading e já esta pronto para uso.
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context){
                            return BlocProvider(bloc: BuildBloc(), child: HomePage(bloc));
                          })
                        );
                      },
                    )
                  ],
                );
              }
            }else{
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );
  }
}