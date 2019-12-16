import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';
import 'package:social_wakfu/View/ViewBuild/points_build.dart';
import 'package:social_wakfu/View/ViewBuild/spells_build.dart';
import 'package:flutter/services.dart';
import 'package:social_wakfu/View/ViewBuild/view_build.dart';

class ViewBuild extends StatelessWidget {

  final ItemBloc itemBloc;
  final BuildBloc buildBloc;

  ViewBuild(this.itemBloc, this.buildBloc);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FragViewBuild(itemBloc, BlocProvider.of<ViewBuildBloc>(context), MediaQuery.of(context).size), 
            FragPointsBuild(itemBloc, buildBloc), 
            FragSpellsBuild(itemBloc, buildBloc)
          ]
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: "BUILD"),
            Tab(text: "POINTS"),
            Tab(text: "SPELLS")
          ],
          indicatorColor: theme.primaryColor,
          unselectedLabelColor: Colors.grey,
          labelColor: theme.primaryColor,
        ),
      )
    );
  }
}