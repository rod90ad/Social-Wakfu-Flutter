import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Locale/localization.dart';
import 'package:social_wakfu/View/Fragments/BuildsFragment.dart';
import 'package:social_wakfu/View/Fragments/HomeFragment.dart';
import 'package:social_wakfu/View/Fragments/MarketFragment.dart';

class HomePage extends StatelessWidget {
  
  final ItemBloc itemBloc;

  HomePage(this.itemBloc);
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomeFragment(this.itemBloc), 
            BuildsFragment(this.itemBloc), 
            MarketFragment(this.itemBloc)
          ]
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: MyLocalizations.of(context).home),
            Tab(text: MyLocalizations.of(context).build),
            Tab(text: MyLocalizations.of(context).market)
          ],
          indicatorColor: theme.primaryColor,
          unselectedLabelColor: Colors.grey,
          labelColor: theme.primaryColor,
        ),
      ),
    );
  }
}
