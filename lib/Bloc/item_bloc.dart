import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_wakfu/Locale/localization.dart';
import 'package:social_wakfu/Model/effect.dart';
import 'package:social_wakfu/Model/item.dart';
import 'package:social_wakfu/Model/itemType.dart';
import 'package:social_wakfu/Model/propertie.dart';

const String url = "https://wakfu.cdn.ankama.com/gamedata";
const String itemTypeFile = "ItemType";
const String actionsFile = "Actions";
const String propertiesFile = "Properties";
const String itemsFile = "Items";

class ItemBloc implements BlocBase {
  
  //instance variables
  String _version = "";
  List<ItemType> itemTypeList = List<ItemType>();
  List<Effect> effectsList = List<Effect>();
  List<Propertie> propertiesList = List<Propertie>();
  List<Item> itemsList = List<Item>();

  //loading controll
  final _loading = BehaviorSubject<Map<String,dynamic>>();
  Stream<Map<String,dynamic>> get loadingState => _loading.stream;

  //update progress
  final _update = BehaviorSubject<Map<String,dynamic>>();
  Stream<Map<String,dynamic>> get progressUpdate => _update.stream;
  
  ItemBloc(BuildContext context){
    _loading.sink.add({"loading":true, "updating":false});
    _update.sink.add({"total":8, "atual":1, "label":MyLocalizations.of(context).update11, "percent":0.0});
    SharedPreferences.getInstance().then((pref) async {
      //pref.clear(); //clear sharedPreferences to reset database.
      if(pref.getKeys().contains("version")){
        _version = await _getVersion();
        //print("Version: $_version");
        if(_version == pref.get("version")){
          //Has version saved
          _readData(itemTypeFile).then((source){
            if(source!=null){
              List tempIT = json.decode(source);
              itemTypeList = tempIT.map((it) => ItemType.fromDB(it)).toList();
            }
          });
          _readData(actionsFile).then((source){
            if(source!=null){
              List tempAc = json.decode(source);
              effectsList = tempAc.map((map) => Effect.fromDB(map)).toList();
            }
          });
          _readData(propertiesFile).then((source){
            if(source!=null){
              List tempProp = json.decode(source);
              propertiesList = tempProp.map((map) => Propertie.fromDB(map)).toList();
            }
          });
          _readData(itemsFile).then((data){
            if(data!=null){
              List temp = json.decode(data);
              itemsList = temp.map((map) => Item.fromDB(map)).toList();
            }
          });
          _loading.sink.add({"loading":false, "updating":false});
          //TODO: Fazer o Login com o google silenciosamente
        }else{
          //No past version, populate Files
          _loading.sink.add({"loading":true, "updating":true});
          _popularBD(_version, context);
        }
      }else{
        //Update no Banco de dados necessario.
        _version = await _getVersion();
        //print("Version: $_version");
        _loading.sink.add({"loading":true, "updating":true});
        _popularBD(_version, context);
      }
    });
  }

  Future<String> _getVersion() async {
    http.Response response;
    response = await http.get("$url/config.json");
    return json.decode(response.body)["version"];
  }

  void _popularBD(String version, BuildContext context) async {
    http.Response response;
    String content;

    //4 downloads e 4 uploads = 8 etapas
    //################## ItemType ##################
    //etapa 1 download dos itemType
    response = await http.get("$url/$version/equipmentItemTypes.json");
    content = utf8.decode(response.bodyBytes);
    _update.sink.add({"total":8, "atual":1, "label":MyLocalizations.of(context).update11, "percent":1.0});
    //Etapa 2 update itemTypes
    List tempTypeList = (json.decode(content) as List).map((itemType) => ItemType.FromMap(itemType).toMap()).toList();
    _update.sink.add({"label":MyLocalizations.of(context).update12,"percent":0.0,"atual":2,"total":8});
    await _saveData(tempTypeList, itemTypeFile);
    _update.sink.add({"label":MyLocalizations.of(context).update12,"percent":1.0,"atual":2,"total":8});

    //################## Actions ##################
    //etapa 3 download Actions
    _update.sink.add({"label":MyLocalizations.of(context).update21,"percent":0.0,"atual":3,"total":8});
    content = "";
    response = await http.get("$url/$version/actions.json");
    content = utf8.decode(response.bodyBytes);
    _update.sink.add({"label":MyLocalizations.of(context).update21,"percent":1.0,"atual":3,"total":8});
    List tempEffectsList = (json.decode(content) as List).map((map) => Effect.FromMap(map).toMap()).toList();
    //Etapa 4 update Actions
    _update.sink.add({"label":MyLocalizations.of(context).update22,"percent":0.0,"atual":4,"total":8});
    await _saveData(tempEffectsList, actionsFile);
    _update.sink.add({"label":MyLocalizations.of(context).update22,"percent":1.0,"atual":4,"total":8});

    //################## Properties ##################
    //Etapa 5 download properties
    _update.sink.add({"label":MyLocalizations.of(context).update31,"percent":0.0,"atual":5,"total":8});
    content = "";
    response = await http.get("$url/$version/itemProperties.json");
    content = utf8.decode(response.bodyBytes);
    _update.sink.add({"label":MyLocalizations.of(context).update31,"percent":1.0,"atual":5,"total":8});
    List tempPropertiesList = (json.decode(content) as List).map((map) => Propertie.fromMap(map).toMap()).toList();
    //Etapa 6 update Properties
    _update.sink.add({"label":MyLocalizations.of(context).update32,"percent":0.0,"atual":6,"total":8});
    await _saveData(tempPropertiesList, propertiesFile);
    _update.sink.add({"label":MyLocalizations.of(context).update32,"percent":1.0,"atual":6,"total":8});

    //################## Items ##################
    //Etapa 7 Download Items
    _update.sink.add({"label":MyLocalizations.of(context).update41,"percent":0.0,"atual":7,"total":8});
    content = "";
    response = await http.get("$url/$version/items.json");
    content = utf8.decode(response.bodyBytes);
    _update.sink.add({"label":MyLocalizations.of(context).update41,"percent":1.0,"atual":7,"total":8});
    List tempItemsList = (json.decode(content) as List).map((map) => Item.fromMap(map).toMap()).toList();
    //Etapa 8 update Items
    _update.sink.add({"label":MyLocalizations.of(context).update42,"percent":0.0,"atual":8,"total":8});
    await _saveData(tempItemsList, itemsFile);
    _update.sink.add({"label":MyLocalizations.of(context).update42,"percent":1.0,"atual":8,"total":8});

    //fazendo update na versão
    SharedPreferences.getInstance().then((pref){
      pref.setString("version", version);
    });
    _loading.add({"loading":false,"updating":false});
  }

  Future<File> _getFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$fileName.json");
  }

  Future<File> _saveData(List list, String fileName) async {
    String data = json.encode(list);
    final file = await _getFile(fileName);
    return file.writeAsString(data);
  }

  Future<String> _readData(String fileName) async {
    try {
      final file = await _getFile(fileName);
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  int getItemCount(){
    return itemsList.length;
  }

  Item getItem(int id){
    List<Item> query = itemsList.where((item) => item.itemId==id).toList();
    if(query.length>0){
      return query.first;
    }
    return null;
  }
  
  @override
  void dispose() {
    _update.close();
    _loading.close();
  }
}