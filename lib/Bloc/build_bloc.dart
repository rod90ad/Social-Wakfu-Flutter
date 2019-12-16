import 'dart:convert';
import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

//BD NAME
final String fileName = "Builds";

//Atributos normais
final String idColumn = "_ID";
final String nameColumn = "NAME";
final String nivelColumn = "NIVEL";
final String isOnlineColumn = "ISONLINE";
final String elementPColumn = "ELEMENT_PRIORITY";
final String resistPColumn = "RESISTENCE_PRIORITY";
final String classeColumn = "CLASSE";
final String descriptionColumn = "DESCRIPTION";

//Items ID
final String elmoIdColumn = "ELMO_ID";
final String dragIdColumn = "DRAG_ID";
final String amulIdColumn = "AMULET_ID";
final String botsIdColumn = "BOOTS_ID";
final String breastIdColumn = "BREASTPLATE_ID";
final String beltIdColumn = "BELT_ID";
final String cloakIdColumn = "CLOAK_ID";
final String ring1IdColumn = "RING1_ID";
final String ring2IdColumn = "RING2_ID";
final String petIdColumn = "PET_ID";
final String montIdColumn = "MONT_ID";
final String insIdColumn = "INSIGN_ID";
final String leftHandIdColumn = "LEFTHAND_ID";
final String rightHandIdColumn = "RIGHTHAND_ID";

//Pontos
//Inteligencia
final String intPointsColumn = "INT_POINTS";
final String apinLifePercentColumn = "APIN_LIFEPERCENT";
final String apinResEleColumn = "APIN_RESISTENCE_ELEMENTAL";
final String apinBarreiraColumn = "APIN_BARRIER";
final String apinHealRecievedColumn = "APIN_HEAL_RECIEVED";
final String apinLifeAndArmorColumn = "APIN_LIFE_AND_ARMOR";
//Força
final String forcePointsColumn = "FORCE_POINTS";
final String apinGeralColumn = "APIN_ELEMENTAL";
final String apinSTColumn = "APIN_SINGLE_TARGET";
final String apinAreaColumn = "APIN_AREA";
final String apinCaCColumn = "APIN_CLOSE_COMBAT";
final String apinDistanceColumn = "APIN_DISTANCE";
final String apinLifeColumn = "APIN_LIFE";
//Agilidade
final String agiPointsColumn = "AGI_POINTS";
final String apinBlockColumn = "APIN_BLOCK";
final String apinDodgeColumn = "APIN_DODGE";
final String apinIniColumn = "APIN_INI";
final String apinBlockAndDodgeColumn = "APIN_BLOCK_AND_DODGE";
final String apinRemoveAPAndMPColumn = "APIN_REMOVE_AP_MP";
final String apinResAPAndMPColumn = "APIN_RES_AP_MP";
//Sorte
final String luckPointsColumn = "LUCK_POINTS";
final String apinGolpeCriticoColumn = "APIN_CRITICAL_HIT";
final String apinParadaColumn = "APIN_STOP";
final String apinDanoCriticoColumn = "APIN_CRITICAL_DMG";
final String apinRearDmgColumn = "APIN_REAR_DMG";
final String apinBerserkDmgColumn = "APIN_BERSERK_DMG";
final String apinHealColumn = "APIN_HEAL";
final String apinResBackDmgColumn = "APIN_RES_BACK_DMG";
final String apinResCriticalDmgColumn = "APIN_RES_CRITICAL_DMG";
//principal
final String mainPointsColumn = "MAIN_POINTS";
final String apinAPColumn = "APIN_AP";
final String apinMPColumn = "APIN_MP";
final String apinRangeAndDmgColumn = "APIN_RANGE";
final String apinWPColumn = "APIN_WP";
final String apinControlAndDmgColumn = "APIN_CONTROL";
final String apinKitSkillColumn = "APIN_KITSKILL";
final String apinFinalDmgColumn = "APIN_FINAL_DMG";
final String apinResElementalColumn = "APIN_RES_ELEMENTAL";

//Spells
//Actives
final String spell1Column = "ACTIVE_SPELL_1";
final String spell2Column = "ACTIVE_SPELL_2";
final String spell3Column = "ACTIVE_SPELL_3";
final String spell4Column = "ACTIVE_SPELL_4";
final String spell5Column = "ACTIVE_SPELL_5";
final String spell6Column = "ACTIVE_SPELL_6";
final String spell7Column = "ACTIVE_SPELL_7";
final String spell8Column = "ACTIVE_SPELL_8";
final String spell9Column = "ACTIVE_SPELL_9";
final String spell10Column = "ACTIVE_SPELL_10";
final String spell11Column = "ACTIVE_SPELL_11";
final String spell12Column = "ACTIVE_SPELL_12";
//Passives
final String passiveSpell1Column = "PASSIVE_SPELL_1";
final String passiveSpell2Column = "PASSIVE_SPELL_2";
final String passiveSpell3Column = "PASSIVE_SPELL_3";
final String passiveSpell4Column = "PASSIVE_SPELL_4";
final String passiveSpell5Column = "PASSIVE_SPELL_5";
final String passiveSpell6Column = "PASSIVE_SPELL_6";

class BuildBloc implements BlocBase{
 
  //Lista de builds
  List<Build> _builds = List<Build>();

  final _totalBuilds = BehaviorSubject<List<Build>>();
  Stream<List<Build>> get builds => _totalBuilds.stream;

  BuildBloc(){
    _totalBuilds.sink.add(_builds);
    _readData().then((source){
      if(source!=null){
        List temp = json.decode(source);
        _builds = temp.map((map) => Build.fromMap(map)).toList();
        _totalBuilds.sink.add(_builds);
      }else{
        print("Builds = vazio");
      }
    });
  }
  
  @override
  void dispose() {
    _totalBuilds.close();
  }

  Future<File> saveBuild(Build build) async{
    _builds.add(build);
    List temp = _builds.map((b) => b.toMap()).toList();
    print(temp);
    String data = json.encode(temp);
    final file = await _getFile();
    File retorno = await file.writeAsString(data);
    if(retorno!=null){
      _totalBuilds.sink.add(_builds);
      return retorno;
    }else{
      _builds.removeLast();
      return null;
    }
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$fileName.json");
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

}

class Build{

  Build();

  Build.fromMap(Map map){
    //Atributos normais
    id = map[idColumn];
    name = map[nameColumn];
    nivel = map[nivelColumn];
    isOnline = map[isOnlineColumn];
    elementp = map[elementPColumn];
    resistp = map[resistPColumn];
    classe = map[classeColumn];
    description = map[descriptionColumn];
    //Items ID
    elmoId = map[elmoIdColumn];
    dragId = map[dragIdColumn];
    amulId = map[amulIdColumn];
    botsId = map[botsIdColumn];
    breastId = map[breastIdColumn];
    beltId = map[beltIdColumn];
    cloakId = map[cloakIdColumn];
    ring1Id = map[ring1IdColumn];
    ring2Id = map[ring2IdColumn];
    petId = map[petIdColumn];
    montId = map[montIdColumn];
    insId = map[insIdColumn];
    leftHandId = map[leftHandIdColumn];
    rightHandId = map[rightHandIdColumn];
    //Pontos
    //Inteligencia
    intPoints = map[intPointsColumn];
    apinlifepercent = map[apinLifePercentColumn];
    apinresele = map[apinResEleColumn];
    apinbarreira = map[apinBarreiraColumn];
    apinhealrecived = map[apinHealRecievedColumn];
    apinlifearmor = map[apinLifeAndArmorColumn];
    //Força
    forcePoints = map[forcePointsColumn];
    apingeral= map[apinGeralColumn];
    apinalvounico = map[apinSTColumn];
    apinzona = map[apinAreaColumn];
    apinCaC = map[apinCaCColumn];
    apindistance = map[apinDistanceColumn];
    apinlife = map[apinLifeColumn];
    //Agilidade
    agiPoints = map[agiPointsColumn];
    apinblock = map[apinBlockColumn];
    apinesquiva = map[apinDodgeColumn];
    apininiciativa = map[apinIniColumn];
    apinblockandesquiva = map[apinBlockAndDodgeColumn];
    apinremovepaandpm = map[apinRemoveAPAndMPColumn];
    apinrespaepm = map[apinResAPAndMPColumn];
    //Sorte
    luckPoints = map[luckPointsColumn];
    apingolpecritico = map[apinGolpeCriticoColumn];
    apinparada = map[apinParadaColumn];
    apindanocritico = map[apinDanoCriticoColumn];
    apinbackdmg = map[apinRearDmgColumn];
    apinberserkdmg = map[apinBerserkDmgColumn];
    apinheal = map[apinHealColumn];
    apinresbackdmg = map[apinResBackDmgColumn];
    apincritialres = map[apinResCriticalDmgColumn];
    //principal
    especialPoints = map[mainPointsColumn];
    apinactionpoint = map[apinAPColumn];
    apinmovepoint = map[apinMPColumn];
    apinrangeanddmg = map[apinRangeAndDmgColumn];
    apinwakfupoint = map[apinWPColumn];
    apincontrolanddmg = map[apinControlAndDmgColumn];
    apinarteequipar = map[apinKitSkillColumn];
    apinfinalDamage = map[apinFinalDmgColumn];
    apinreselemental = map[apinResElementalColumn];
    //Spells
    //Actives
    spell1 = map[spell1Column];
    spell2 = map[spell2Column];
    spell3 = map[spell3Column];
    spell4 = map[spell4Column];
    spell5 = map[spell5Column];
    spell6 = map[spell6Column];
    spell7 = map[spell7Column];
    spell8 = map[spell8Column];
    spell9 = map[spell9Column];
    spell10 = map[spell10Column];
    spell11 = map[spell11Column];
    spell12 = map[spell12Column];
    //Passives
    pSpell1 = map[passiveSpell1Column];
    pSpell2 = map[passiveSpell2Column];
    pSpell3 = map[passiveSpell3Column];
    pSpell4 = map[passiveSpell4Column];
    pSpell5 = map[passiveSpell5Column];
    pSpell6 = map[passiveSpell6Column];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      //atributos normais
      nameColumn: name,
      nivelColumn: nivel,
      isOnlineColumn: isOnline,
      elementPColumn: elementp,
      resistPColumn: resistp,
      classeColumn: classe,
      descriptionColumn: description,
      //items ID
      elmoIdColumn: elmoId,
      dragIdColumn: dragId,
      amulIdColumn: amulId,
      botsIdColumn: botsId,
      breastIdColumn: breastId,
      beltIdColumn: beltId,
      cloakIdColumn: cloakId,
      ring1IdColumn: ring1Id,
      ring2IdColumn: ring2Id,
      petIdColumn: petId,
      montIdColumn: montId,
      insIdColumn: insId,
      leftHandIdColumn: leftHandId,
      rightHandIdColumn: rightHandId,
      //pontos
      //Inteligencia
      intPointsColumn: intPoints,
      apinLifePercentColumn: apinlifepercent,
      apinResEleColumn: apinresele,
      apinBarreiraColumn: apinbarreira,
      apinHealRecievedColumn: apinhealrecived,
      apinLifeAndArmorColumn: apinlifearmor,
      //Força
      forcePointsColumn: forcePoints,
      apinGeralColumn: apingeral,
      apinSTColumn: apinalvounico,
      apinAreaColumn: apinzona,
      apinCaCColumn: apinCaC,
      apinDistanceColumn: apindistance,
      apinLifeColumn: apinlife,
      //Agilidade
      agiPointsColumn: agiPoints,
      apinBlockColumn: apinblock,
      apinDodgeColumn: apinesquiva,
      apinIniColumn: apininiciativa,
      apinBlockAndDodgeColumn: apinblockandesquiva,
      apinRemoveAPAndMPColumn: apinremovepaandpm,
      apinResAPAndMPColumn: apinrespaepm,
      //Sorte
      luckPointsColumn: luckPoints,
      apinGolpeCriticoColumn: apingolpecritico,
      apinParadaColumn: apinparada,
      apinDanoCriticoColumn: apindanocritico,
      apinRearDmgColumn: apinbackdmg,
      apinBerserkDmgColumn: apinberserkdmg,
      apinHealColumn: apinheal,
      apinResBackDmgColumn: apinresbackdmg,
      apinResCriticalDmgColumn: apincritialres,
      //principal
      mainPointsColumn: especialPoints,
      apinAPColumn: apinactionpoint,
      apinMPColumn: apinmovepoint,
      apinRangeAndDmgColumn: apinrangeanddmg,
      apinWPColumn: apinwakfupoint,
      apinControlAndDmgColumn: apincontrolanddmg,
      apinKitSkillColumn: apinarteequipar,
      apinFinalDmgColumn: apinfinalDamage,
      apinResElementalColumn: apinreselemental,
      //Spells
      //Actives
      spell1Column: spell1,
      spell2Column: spell2,
      spell3Column: spell3,
      spell4Column: spell4,
      spell5Column: spell5,
      spell6Column: spell6,
      spell7Column: spell7,
      spell8Column: spell8,
      spell9Column: spell9,
      spell10Column: spell10,
      spell11Column: spell11,
      spell12Column: spell12,
      //Passives
      passiveSpell1Column: pSpell1,
      passiveSpell2Column: pSpell2,
      passiveSpell3Column: pSpell3,
      passiveSpell4Column: pSpell4,
      passiveSpell5Column: pSpell5,
      passiveSpell6Column: pSpell6
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Build(id: $id, name: $name, nivel: $nivel, elementP: $elementp, resistP: $resistp, Classe: $classe)";
  }

  //atributos normais
  int id;
  String name;
  int nivel;
  bool isOnline;
  String elementp;
  String resistp;
  int classe;
  String description;

  //items
  int elmoId;
  int dragId;
  int amulId;
  int botsId;
  int breastId;
  int beltId;
  int cloakId;
  int ring1Id;
  int ring2Id;
  int petId;
  int montId;
  int insId;
  int leftHandId;
  int rightHandId;

  //pontos
  //inteligencia
  int intPoints=-1;    //nao aplicados
  int apinlifepercent=0;
  int apinresele=0;
  int apinbarreira=0;
  int apinhealrecived=0;
  int apinlifearmor=0;

  //força
  int forcePoints=-1;
  int apingeral=0;
  int apinalvounico=0;
  int apinzona=0;
  int apinCaC=0;
  int apindistance=0;
  int apinlife=0;

  //agilidade
  int agiPoints=-1;
  int apinblock=0;
  int apinesquiva=0;
  int apininiciativa=0;
  int apinblockandesquiva=0;
  int apinremovepaandpm=0;
  int apinrespaepm=0;

  //sorte
  int luckPoints=-1;
  int apingolpecritico=0;
  int apinparada=0;
  int apindanocritico=0;
  int apinbackdmg=0;
  int apinberserkdmg=0;
  int apinheal=0;
  int apinresbackdmg=0;
  int apincritialres=0;

  //principal
  int especialPoints=-1;
  int apinactionpoint=0;
  int apinmovepoint=0;
  int apinrangeanddmg=0;
  int apinwakfupoint=0;
  int apincontrolanddmg=0;
  int apinarteequipar=0;
  int apinfinalDamage=0;
  int apinreselemental=0;

  //skills
  int spell1=0;
  int spell2=0;
  int spell3=0;
  int spell4=0;
  int spell5=0;
  int spell6=0;
  int spell7=0;
  int spell8=0;
  int spell9=0;
  int spell10=0;
  int spell11=0;
  int spell12=0;

  //passives
  int pSpell1=0;
  int pSpell2=0;
  int pSpell3=0;
  int pSpell4=0;
  int pSpell5=0;
  int pSpell6=0;

}