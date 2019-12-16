import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';

class ViewBuildEspecialStatsTile extends StatelessWidget {
  
  ViewBuildBloc buildBloc;
  int idx;

  ViewBuildEspecialStatsTile(this.buildBloc, this.idx);

  Color getColor(BuildContext context){
    switch(idx){
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue[700];
      case 2:
        return Colors.green;
      case 3:
        return Theme.of(context).primaryColor;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/view_${idx}_especial.png")
        )
      ),
      child: Container(
        margin: EdgeInsets.only(top: 5, right: 5),
        child: StreamBuilder(
          stream: buildBloc.getEspecialStreamByIndex(idx),
          builder: (context, snapshot){
            return Text("${snapshot.data}", textAlign: TextAlign.right, style: TextStyle(color: getColor(context), fontSize: 13, fontWeight: FontWeight.bold));
          },
        )
      )
    );
  }
}