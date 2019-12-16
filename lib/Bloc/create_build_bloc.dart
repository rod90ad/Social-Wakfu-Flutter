import 'dart:math';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';

class CreateBuildBloc implements BlocBase{
  
  BuildBloc buildBloc;

  TextEditingController buildDescriptionController = TextEditingController();
  
  final _headIdx = BehaviorSubject<int>();
  Stream<int> get head => _headIdx.stream;
  final _buildName = BehaviorSubject<String>();
  Stream<String> get buildName => _buildName.stream;
  final _buildLevel = BehaviorSubject<int>();
  Stream<int> get buildLevel => _buildLevel.stream;
  final _ele1p = BehaviorSubject<int>();
  Stream<int> get ele1p => _ele1p.stream;
  final _ele2p = BehaviorSubject<int>();
  Stream<int> get ele2p => _ele2p.stream;
  final _ele3p = BehaviorSubject<int>();
  Stream<int> get ele3p => _ele3p.stream;
  final _ele4p = BehaviorSubject<int>();
  Stream<int> get ele4p => _ele4p.stream;
  final _res1p = BehaviorSubject<int>();
  Stream<int> get res1p => _res1p.stream;
  final _res2p = BehaviorSubject<int>();
  Stream<int> get res2p => _res2p.stream;
  final _res3p = BehaviorSubject<int>();
  Stream<int> get res3p => _res3p.stream;
  final _res4p = BehaviorSubject<int>();
  Stream<int> get res4p => _res4p.stream;

  CreateBuildBloc(BuildBloc buildBloc){
    this.buildBloc = buildBloc;
    Random rnd = Random();
    int head = rnd.nextInt(17 - 0);
    _headIdx.sink.add(head);
    _buildLevel.sink.add(200);
    _ele1p.sink.add(0);
    _ele2p.sink.add(0);
    _ele3p.sink.add(0);
    _ele4p.sink.add(0);
    _res1p.sink.add(0);
    _res2p.sink.add(0);
    _res3p.sink.add(0);
    _res4p.sink.add(0);
  }

  void setHead(int idx){
    print(idx);
    if(idx >= 0 && idx <= 17){
      _headIdx.sink.add(idx);
    }
  }

  Future<bool> _saveBuild(BuildContext context) async{
    Build build = Build();
    build.name = _buildName.value;
    build.nivel = _buildLevel.value;
    build.elementp = (_ele1p.value.toString() + "-" + _ele2p.value.toString() + "-" + _ele3p.value.toString() + "-" + _ele4p.value.toString());
    build.resistp = (_res1p.value.toString() + "-" + _res2p.value.toString() + "-" + _res3p.value.toString() + "-" + _res4p.value.toString());
    build.classe = _headIdx.value;
    build.description = buildDescriptionController.value.text;
    //calcula os pontos que a pessoa tem para adicionar
    int n1 = (_buildLevel.value ~/ 4);
    double parm1 = (n1+0.25);
    double parm2 = (n1+0.5);
    double parm3 = (n1+0.75);
    print("Build/4: " + (_buildLevel.value /4).toString() + "\nParam1: " + parm1.toString() + "\nParam2: " + parm2.toString() + "\nParam3: " + parm3.toString());
    //define os pontos especiais
    if (build.nivel >= 175) {
      build.especialPoints = 4;
    } else if (build.nivel >= 125) {
      build.especialPoints = 3;
    } else if (build.nivel >= 75) {
      build.especialPoints = 2;
    } else if (build.nivel >= 25) {
      build.especialPoints = 1;
    } else {
      build.especialPoints = 0;
    }
    //Define os outros pontos
    if(n1 == (build.nivel/4.0)){
      build.intPoints = (build.nivel ~/ 4);
      build.forcePoints = (build.nivel ~/ 4);
      build.agiPoints = (build.nivel ~/ 4);
      if (build.nivel == 200) {
          build.luckPoints = (build.nivel ~/ 4);
      } else {
          build.luckPoints = ((build.nivel ~/ 4) - 1);
      }
    }else if(parm1 == (build.nivel/4.0)) {
      build.intPoints = (build.nivel ~/ 4);
      build.forcePoints = (build.nivel ~/ 4);
      build.agiPoints = (build.nivel ~/ 4);
      build.luckPoints = (build.nivel ~/ 4);
    } else if (parm2 == (build.nivel/4.0)) {
        build.intPoints = ((build.nivel ~/ 4) + 1);
        build.forcePoints = (build.nivel ~/ 4);
        build.agiPoints = (build.nivel ~/ 4);
        build.luckPoints = (build.nivel ~/ 4);
    } else if (parm3 == (build.nivel/4.0)) {
        build.intPoints = ((build.nivel ~/ 4) + 1);
        build.forcePoints = ((build.nivel ~/ 4) + 1);
        build.agiPoints = (build.nivel ~/ 4);
        build.luckPoints = (build.nivel ~/ 4);
    }
    print("Especial:" + build.especialPoints.toString() + "\nInt:" + build.intPoints.toString() + "\nForce:" + build.forcePoints.toString() + "\nAgi:" + build.agiPoints.toString() + "\nLuck:" + build.luckPoints.toString());
    if(await buildBloc.saveBuild(build) != null){
      return true;
    }
    return false;
  }

  void finish(BuildContext context) async{
    if(_buildName.value != null && _buildName.value.isNotEmpty){
      if(_ele1p.value != 0 && _ele2p.value != 0 && _ele3p.value != 0 && _ele4p.value != 0){
        if(_res1p.value != 0 && _res2p.value != 0 && _res3p.value != 0 && _res4p.value != 0){
          if(await _saveBuild(context)){
            showDialog(
            context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Success!"),
                  content: Text("Build Saved!"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("OK", style: TextStyle(color: Theme.of(context).primaryColor),),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            );
          }
        }else{
          print("Resistencias prioritarias invalidos");
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Error"),
                content: Text("Select all priority elements"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK", style: TextStyle(color: Theme.of(context).primaryColor),),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
          );
        }
      }else{
        print("Elementos prioritarios invalidos");
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Error"),
              content: Text("Select all priority elements"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK", style: TextStyle(color: Theme.of(context).primaryColor),),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
        );
      }
    }else{
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Error"),
            content: Text("Name can't be empty"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK", style: TextStyle(color: Theme.of(context).primaryColor),),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
      );
    }
  }

  void setBuildLevel(int level){
    if(level >= 1 && level <=200){
      _buildLevel.sink.add(level);
    }
  }

  void setBuildName(String name){
    _buildName.sink.add(name);
  }

  bool _verifyElement(int ele){
    bool retorno = true;
    if(_ele1p.value == ele){
      return false;
    }
    if(_ele2p.value == ele){
      return false;
    }
    if(_ele3p.value == ele){
      return false;
    }
    if(_ele4p.value == ele){
      return false;
    }
    return retorno;
  }

  void setEleP(int elep){
    if(_verifyElement(elep)){
      if(_ele1p.value == 0){
        _ele1p.sink.add(elep);
      }else if(_ele2p.value == 0){
        _ele2p.sink.add(elep);
      }else if(_ele3p.value == 0){
        _ele3p.sink.add(elep);
      }else if(_ele4p.value == 0){
        _ele4p.sink.add(elep);
      }
    }
  }

  bool _verifyResistence(int ele){
    bool retorno = true;
    if(_res1p.value == ele){
      return false;
    }
    if(_res2p.value == ele){
      return false;
    }
    if(_res3p.value == ele){
      return false;
    }
    if(_res4p.value == ele){
      return false;
    }
    return retorno;
  }

  void setResP(int resp){
    if(_verifyResistence(resp)){
      if(_res1p.value == 0){
        _res1p.sink.add(resp);
      }else if(_res2p.value == 0){
        _res2p.sink.add(resp);
      }else if(_res3p.value == 0){
        _res3p.sink.add(resp);
      }else if(_res4p.value == 0){
        _res4p.sink.add(resp);
      }
    }
  }

  void removeEle(int elep){
    switch(elep){
      case 1:
        _ele1p.sink.add(0);
        break;
      case 2:
        _ele2p.sink.add(0);
        break;
      case 3:
        _ele3p.sink.add(0);
        break;
      case 4:
        _ele4p.sink.add(0);
        break;
    }
  }

  void removeRes(int resp){
    switch(resp){
      case 1: 
        _res1p.sink.add(0);
        break;
      case 2:
        _res2p.sink.add(0);
        break;
      case 3:
        _res3p.sink.add(0);
        break;
      case 4:
        _res4p.sink.add(0);
        break;
    }
  }

  void setRes1p(int par){
    _res1p.sink.add(par);
  }

  void setRes2p(int par){
    _res2p.sink.add(par);
  }

  void setRes3p(int par){
    _res3p.sink.add(par);
  }

  void setRes4p(int par){
    _res4p.sink.add(par);
  }

  @override
  void dispose() {
    _headIdx.close();
    _buildName.close();
    _buildLevel.close();
    _ele1p.close();
    _ele2p.close();
    _ele3p.close();
    _ele4p.close();
    _res1p.close();
    _res2p.close();
    _res3p.close();
    _res4p.close();

  }

}