//Effects table
const String effectsActionId = "actionId";
const String effectsEffect = "effect";
const String effectsDescriptionEN = "description_en";
const String effectsDescriptionES = "description_es";
const String effectsDescriptionFR = "description_fr";
const String effectsDescriptionPT = "description_pt";

class Effect {

  int actionId;
  String effect;
  String description_pt;
  String description_en;
  String description_es;
  String description_fr;

  Effect.FromMap(Map map){
    actionId = map["definition"]["id"];
    effect = map["definition"]["effect"];
    description_pt = map.containsKey('description') ? map["description"]["pt"] : "";
    description_es = map.containsKey('description') ? map["description"]["es"] : "";
    description_en = map.containsKey('description') ? map["description"]["en"] : "";
    description_fr = map.containsKey('description') ? map["description"]["fr"] : "";
  }

  Effect.fromDB(Map map){
    actionId = map[effectsActionId];
    effect = map[effectsEffect];
    description_pt = map[effectsDescriptionPT];
    description_es = map[effectsDescriptionES];
    description_fr = map[effectsDescriptionFR];
    description_en = map[effectsDescriptionEN];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      effectsActionId: actionId,
      effectsEffect: effect,
      effectsDescriptionPT: description_pt,
      effectsDescriptionEN: description_en,
      effectsDescriptionES: description_es,
      effectsDescriptionFR: description_fr
    };
    return map;
  }

  @override
  String toString() {
    return "ActionId:$actionId, Effect:$effect, Desc_PT:$description_pt, Desc_EN:$description_en, Desc_ES:$description_es, Desc_FR:$description_fr";
  }
}