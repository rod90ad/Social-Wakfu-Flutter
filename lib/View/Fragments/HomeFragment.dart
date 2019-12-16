import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';

class HomeFragment extends StatelessWidget {
  
  final ItemBloc bloc;

  HomeFragment(this.bloc);
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColorDark,
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () {},
      ),
    );
  }
}