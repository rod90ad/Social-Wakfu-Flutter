//table de effeitos de item
const String itemEffectsId = "_id";
const String itemEffectsItemId = "itemId";
const String itemEffectsActionId = "actionId";
const String itemEffectsParam = "param";

class ItemEffect{

  int itemId;
  int effectId;
  double param;

  ItemEffect.FromMap(Map map, int id){
    //print(id);
    itemId = id;
    effectId = map["effect"]["definition"]["actionId"];
    param = map["effect"]["definition"]["params"].length == 0 ? 0.00 : map["effect"]["definition"]["params"][0];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      itemEffectsItemId: itemId,
      itemEffectsActionId: effectId,
      itemEffectsParam: param,
    };
    return map;
  }

  @override
  String toString() {
    return "ItemId:$itemId, ActionId:$effectId, Param:$param";
  }
}