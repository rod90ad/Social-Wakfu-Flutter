import 'package:social_wakfu/Model/itemEffect.dart';

//items table
const String itemsId = "id";
const String itemsLevel = "level";
const String itemsTypeId = "itemTypeId";
const String itemsSetId = "itemSetId";
const String itemsRarity = "rarity";
const String itemsGFX = "gfx";
const String itemsGemElementType = "gemElementType";
const String itemsGemNumber = "gemNum";
const String itemsPropertiesId = "propertiesId";
const String itemsTitlePT = "title_pt";
const String itemsTitleEN = "title_en";
const String itemsTitleES = "title_es";
const String itemsTitleFR = "title_fr";
const String itemsDescriptionPT = "description_pt";
const String itemsDescriptionEN = "description_en";
const String itemsDescriptionES = "description_es";
const String itemsDescriptionFR = "description_fr";

class Item{

  int itemId;
  int level;
  int itemTypeId;
  int itemSetId;
  int itemRarity;
  int gfx;
  int gemElementType;
  int gemNumber;
  int propertiesId;
  String title_pt;
  String title_en;
  String title_es;
  String title_fr;
  String description_pt;
  String description_en;
  String description_es;
  String description_fr;
  List<ItemEffect> effects;

  Item.fromDB(Map map){
    itemId = map[itemsId];
    level = map[itemsLevel];
    itemTypeId = map[itemsTypeId];
    itemSetId = map[itemsSetId];
    itemRarity = map[itemsRarity];
    gfx = map[itemsGFX];
    gemElementType = map[itemsGemElementType];
    gemNumber = map[itemsGemNumber];
    propertiesId = map[itemsPropertiesId];
    title_pt = map[itemsTitlePT];
    title_es = map[itemsTitleES];
    title_en = map[itemsTitleEN];
    title_fr = map[itemsTitleFR];
    description_pt = map[itemsDescriptionPT];
    description_es = map[itemsDescriptionES];
    description_en = map[itemsDescriptionEN];
    description_fr = map[itemsDescriptionFR];
  }

  Item.fromMap(Map map){
    itemId = map["definition"]["item"]["id"];
    level = map["definition"]["item"]["level"];
    itemTypeId = map["definition"]["item"]["baseParameters"]["itemTypeId"];
    itemSetId = map["definition"]["item"]["baseParameters"]["itemSetId"];
    itemRarity = map["definition"]["item"]["baseParameters"]["rarity"];
    gfx = map["definition"]["item"]["graphicParameters"]["gfxId"];
    if(map["definition"]["item"]["gemParameters"]!=null){
      gemElementType = map["definition"]["item"]["gemParameters"]["gemElementType"];
      gemNumber = map["definition"]["item"]["gemParameters"]["gemNum"];
    }
    propertiesId = map["definition"]["item"]["properties"].isEmpty ? 0 : map["definition"]["item"]["properties"][0];
    if(map["title"]!=null){
      title_pt = map["title"]["pt"];
      title_es = map["title"]["es"];
      title_en = map["title"]["en"];
      title_fr = map["title"]["fr"];
    }    
    if(map.containsKey("description")){
      description_pt = map["description"]["pt"];
      description_es = map["description"]["es"];
      description_en = map["description"]["en"];
      description_fr = map["description"]["fr"];
    }
    effects = List<ItemEffect>();
    for(int i=0; i<map["definition"]["equipEffects"].length;i++){
      effects.add(ItemEffect.FromMap(map["definition"]["equipEffects"][i], itemId));
    }
  }

  Map toMap(){
    Map<String, dynamic> effectsMap = Map();
    for(int i=0;i<effects.length;i++){
      effectsMap.addAll(effects[i].toMap());
    }
    Map<String, dynamic> map = {
      itemsId: itemId,
      itemsLevel: level,
      itemsTypeId: itemTypeId,
      itemsSetId: itemSetId,
      itemsRarity: itemRarity,
      itemsGFX: gfx,
      itemsGemElementType: gemElementType,
      itemsGemNumber: gemNumber,
      itemsPropertiesId: propertiesId,
      itemsTitlePT: title_pt,
      itemsTitleEN: title_en,
      itemsTitleES: title_es,
      itemsTitleFR: title_fr,
      itemsDescriptionPT: description_pt,
      itemsDescriptionEN: description_en,
      itemsDescriptionES: description_es,
      itemsDescriptionFR: description_fr,
    };
    return map;
  }

  @override
  String toString() {
    return "ItemId:$itemId, Level:$level, Type:$itemTypeId, Set:$itemSetId, Rarity:$itemRarity, GFX:$gfx, GemElementType:$gemElementType, GemNumber:$gemNumber, PropertiesId:$propertiesId"
        "TitlePT:$title_pt, TitleEN:$title_en, TitleES:$title_es, TitleFR:$title_fr, DescriptionPT:$description_pt, DescriptionEN:$description_en, DescriptionES:$description_es, DescriptionFR:$description_fr"
        "Effects:${effects.toString()}";
  }
}