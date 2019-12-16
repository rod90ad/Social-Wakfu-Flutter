import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:social_wakfu/Bloc/create_build_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';

class CreateBuild_SetName extends StatelessWidget {
  
  CreateBuildBloc bloc;
  
  @override
  Widget build(BuildContext context) {
     bloc = BlocProvider.of<CreateBuildBloc>(context);
    
    return Scrollbar(
      child: Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildName(context),
              buildLevel(context),
              buildDescription(context),
              finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget finishButton(BuildContext context){
    return InkWell(
      onTap: (){
        bloc.finish(context);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 4, 0, 2),
        child: Column(
          children: <Widget>[
            RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                  ),
                  child: Padding(padding: EdgeInsets.only(top: 10))),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/view_items.png"),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text("Finish", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10)
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildLevel(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Container(
                width: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                ),
                child: Padding(padding: EdgeInsets.only(top: 10))),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/view_items.png"),
                fit: BoxFit.fill
              )
            ),
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FlatButton(
                child: StreamBuilder(
                  stream: bloc.buildLevel,
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return Text("Level ${snapshot.data}");
                    }else{
                      return Text("Level 200");
                    }
                  },
                ),
                onPressed: (){
                  showPickerDialog(context);
                },
              ),
            ),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10)
            )
          )
        ],
      ),
    );
  }

  showPickerDialog(BuildContext context) {
    return Picker(
      adapter: NumberPickerAdapter(data: [
        NumberPickerColumn(begin: 1, end: 200)
      ]),
      changeToFirst: false,
      looping: true,
      hideHeader: false,
      title: new Text("Select Level"),
      onConfirm: (Picker picker, List value) {
        //print(value.toString());
        int level = json.decode(picker.adapter.text)[0];
        print(level);
        bloc.setBuildLevel(level);
      },
      cancelTextStyle: TextStyle(color: Theme.of(context).primaryColorDark),
      confirmTextStyle: TextStyle(color: Theme.of(context).primaryColorDark)
    ).showModal(context);
  }

  Widget buildName(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 2),
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Container(
                width: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                ),
                child: Padding(padding: EdgeInsets.only(top: 10))),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/view_items.png"),
                fit: BoxFit.fill
              )
            ),
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Build Name",
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.start,
                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 15.0, fontWeight: FontWeight.bold),
                onChanged: (value){
                  bloc.setBuildName(value);
                },
              ),
            ),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10)
            )
          )
        ],
      ),
    );
  }

  Widget buildDescription(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 2),
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(180 / 360),
            child: Container(
                width: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
                ),
                child: Padding(padding: EdgeInsets.only(top: 10))),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/view_items.png"),
                fit: BoxFit.fill
              )
            ),
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.start,
                controller: bloc.buildDescriptionController,
                maxLength: 256,
                maxLines: null,
                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 15.0, fontWeight: FontWeight.bold),                
              ),
            ),
          ),
          Container(
            width: 370,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/end_bg.png"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10)
            )
          )
        ],
      ),
    );
  }
}
