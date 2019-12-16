import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/select_Item_bloc.dart';
import 'package:social_wakfu/Tiles/item_tile.dart';

class SelectItemDialog extends StatelessWidget {
  
  final Size _size;
  final int _selectedId;

  SelectItemDialog(this._size, this._selectedId);
  
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: theme.accentColor, // Change your color here
        ),
        title: Text("Select item", style: TextStyle(color: theme.accentColor)),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop(_selectedId);
            },
            child: Text("Save", style: TextStyle(color: theme.accentColor)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<SelectItemBloc>(context).setEquipedItem(itemId:21866);
        },
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: BlocProvider.of<SelectItemBloc>(context).equipedItem,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  print(snapshot.data);
                  if(snapshot.data!=null){
                    print(snapshot.data);
                    return ItemTile(snapshot.data);
                  }else{
                    print(snapshot.data);
                    return Container(
                      height: 30,
                      width: 30,
                      color: Colors.black,
                    );
                  }
                }else{
                  return Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}