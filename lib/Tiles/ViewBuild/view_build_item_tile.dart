import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';

class ViewBuildItemTile extends StatelessWidget {
  
  final int index;
  final ItemBloc itemBloc;
  final ViewBuildBloc buildBloc;
  
  //icon size
  final iconSize = 15.0;

  ViewBuildItemTile(this.index, this.buildBloc, this.itemBloc);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<int>(
        stream: buildBloc.getStreamByIndex(index),
        builder: (context, snapshot){
          if(snapshot.hasData){
            if(snapshot.data!=null && snapshot.data!= 0){
              return Card(
                child: Container(
                  height: iconSize,
                  width: iconSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/item_empty.png")
                    )
                  ),
                  child: Image.network("https://s.ankama.com/www/static.ankama.com/wakfu/portal/game/item/115/${itemBloc.getItem(snapshot.data).gfx}.png"),
                ),
              );
            }else{
              return Container(
                height: iconSize,
                width: iconSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/item_${index}_empty.png")
                  )
                ),
              );
            }
          }else{
            return Container(
              height: iconSize,
              width: iconSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/item_${index}_empty.png")
                )
              ),
            );
          }
        },
      ),  
    );
  }
}