//itemTypes File
const String itemTypesId = "itemTypeId";
const String itemTypesPosition = "position";
const String itemTypesTitleEN = "title_en";
const String itemTypesTitleES = "title_es";
const String itemTypesTitleFR = "title_fr";
const String itemTypesTitlePT = "title_pt";

class ItemType{

  int id;
  String title_pt;
  String title_es;
  String title_fr;
  String title_en;
  String position;

  ItemType.FromMap(Map map){
    id = map["definition"]["id"];
    title_fr = map["title"]["fr"];
    title_es = map["title"]["es"];
    title_pt = map["title"]["pt"];
    title_en = map["title"]["en"];
    position = map["definition"]["equipmentPositions"].toString();
  }

  ItemType.fromDB(Map map){
    id = map[itemTypesId];
    title_pt = map[itemTypesTitlePT];
    title_es = map[itemTypesTitleES];
    title_fr = map[itemTypesTitleFR];
    title_en = map[itemTypesTitleEN];
    position = map[itemTypesPosition];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      itemTypesId: id,
      itemTypesTitlePT: title_pt,
      itemTypesTitleEN: title_en,
      itemTypesTitleES: title_es,
      itemTypesTitleFR: title_fr,
      itemTypesPosition: position
    };
    return map;
  }

  @override
  String toString() {
    return "id:$id, PT:$title_pt, EN:$title_en, ES:$title_es, FR:$title_fr, Position:$position";
  }

}