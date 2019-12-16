//properties table
const String propertiesId = "propertiesId";
const String propertiesName = "name";

class Propertie{

  int id;
  String name;

  Propertie.fromMap(Map map){
    id = map["id"];
    name = map["name"];
  }

  Propertie.fromDB(Map map){
    id = map[propertiesId];
    name = map[propertiesName];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      propertiesId: id,
      propertiesName: name
    };
    return map;
  }

  @override
  String toString() {
    return "PropertiesId:$id, Name:$name";
  }
}