import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';
import 'package:social_wakfu/Bloc/create_build_bloc.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Tiles/build_tile.dart';
import 'package:social_wakfu/View/CreateBuild.dart';

class BuildsFragment extends StatelessWidget {
  
  final ItemBloc itemBloc;

  BuildsFragment(this.itemBloc);
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    BuildBloc buildBloc = BlocProvider.of<BuildBloc>(context);

    return Scaffold(
        backgroundColor: theme.primaryColorDark,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _showCreateBuildPage(context, buildBloc);
          },
          backgroundColor: theme.primaryColorDark,
          child: Icon(Icons.add, color: theme.accentColor),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 2),
          child: StreamBuilder<List<Build>>(
            stream: buildBloc.builds,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return BuildTile(snapshot.data[index], buildBloc, itemBloc);
                  },
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      );
  }

  void _showCreateBuildPage(BuildContext context, BuildBloc buildBloc)async{
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return BlocProvider(
        bloc: CreateBuildBloc(buildBloc),
        child: CreateBuildPage(),
      );
    }));
  }
}