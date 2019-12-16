import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:social_wakfu/Bloc/build_bloc.dart';

class ViewBuildBloc implements BlocBase{
  
  Build _build;

  ViewBuildBloc(Build build){
    this._build = build;
    setViewBuild(_build);
  }

  //Streams da build em visualização
  final _buildNome = BehaviorSubject<String>();
  final _buildLevel = BehaviorSubject<int>();
  final _buildHead = BehaviorSubject<int>();
  final _buildElep = BehaviorSubject<String>();
  final _buildResp = BehaviorSubject<String>();
  final _buildElmoId = BehaviorSubject<int>();
  final _buildCapaId = BehaviorSubject<int>();
  final _buildDragId = BehaviorSubject<int>();
  final _buildAmulId = BehaviorSubject<int>();
  final _buildRing1Id = BehaviorSubject<int>();
  final _buildRing2Id = BehaviorSubject<int>();
  final _buildCintId = BehaviorSubject<int>();
  final _buildMainHId = BehaviorSubject<int>();
  final _buildSecHId = BehaviorSubject<int>();
  final _buildPeitId = BehaviorSubject<int>();
  final _buildBootId = BehaviorSubject<int>();
  final _buildInsId = BehaviorSubject<int>();
  final _buildMontId = BehaviorSubject<int>();
  final _buildPetId = BehaviorSubject<int>();
  Stream<String> get buildName => _buildNome.stream;
  Stream<int> get buildHead => _buildHead.stream;
  Stream<int> get buildLevel => _buildLevel.stream;
  Stream<String> get buildElep => _buildElep.stream;
  Stream<String> get buildResp => _buildResp.stream;
  Stream<int> get buildElmoId => _buildElmoId.stream;
  Stream<int> get buildCapaId => _buildCapaId.stream;
  Stream<int> get buildDragId => _buildDragId.stream;
  Stream<int> get buildAmulId => _buildAmulId.stream;
  Stream<int> get buildRing1Id => _buildRing1Id.stream;
  Stream<int> get buildRing2Id => _buildRing2Id.stream;
  Stream<int> get buildCintId => _buildCintId.stream;
  Stream<int> get buildMainHId => _buildMainHId.stream;
  Stream<int> get buildSecHId => _buildSecHId.stream;
  Stream<int> get buildPeitId => _buildPeitId.stream;
  Stream<int> get buildBootId => _buildBootId.stream;
  Stream<int> get buildInsId => _buildInsId.stream;
  Stream<int> get buildMontId => _buildMontId.stream;
  Stream<int> get buildPetId => _buildPetId.stream;
  //Status da tela principal
  final _buildHP = BehaviorSubject<int>();
  final _buildPA = BehaviorSubject<int>();
  final _buildPM = BehaviorSubject<int>();
  final _buildPW = BehaviorSubject<int>();
  Stream<int> get buildHP => _buildHP.stream;
  Stream<int> get buildPA => _buildPA.stream;
  Stream<int> get buildPM => _buildPM.stream;
  Stream<int> get buildPW => _buildPW.stream;
  //Elemental dmg and res
  final _buildWaterDmg = BehaviorSubject<int>();
  final _buildWaterRes = BehaviorSubject<int>();
  Stream<int> get buildWaterDmg => _buildWaterDmg.stream;
  Stream<int> get buildWaterRes => _buildWaterRes.stream;
  final _buildFireDmg = BehaviorSubject<int>();
  final _buildFireRes = BehaviorSubject<int>();
  Stream<int> get buildFireDmg => _buildFireDmg.stream;
  Stream<int> get buildFireRes => _buildFireRes.stream;
  final _buildAirDmg = BehaviorSubject<int>();
  final _buildAirRes = BehaviorSubject<int>();
  Stream<int> get buildAirDmg => _buildAirDmg.stream;
  Stream<int> get buildAirRes => _buildAirRes.stream;
  final _buildEarthDmg = BehaviorSubject<int>();
  final _buildEarthRes = BehaviorSubject<int>();
  Stream<int> get buildEarthDmg => _buildEarthDmg.stream;
  Stream<int> get buildEarthRes => _buildEarthRes.stream;
  final _buildPADmg = BehaviorSubject<int>();
  final _buildPARes = BehaviorSubject<int>();
  //Battle Primary
  final _buildFinalDmg = BehaviorSubject<int>();
  Stream<int> get buildFinalDmg => _buildFinalDmg.stream;
  final _buildHealPerformed = BehaviorSubject<int>();
  Stream<int> get buildHealPerformed => _buildHealPerformed.stream;
  final _buildCriticalHits = BehaviorSubject<int>();
  Stream<int> get buildCriticalHits => _buildCriticalHits.stream;
  final _buildBlock = BehaviorSubject<int>();
  Stream<int> get buildBlock => _buildBlock.stream;
  final _buildInitiative = BehaviorSubject<int>();
  Stream<int> get buildInitiative => _buildInitiative.stream;
  final _buildRange = BehaviorSubject<int>();
  Stream<int> get buildRange => _buildRange.stream;
  final _buildDodge = BehaviorSubject<int>();
  Stream<int> get buildDodge => _buildDodge.stream;
  final _buildLock = BehaviorSubject<int>();
  Stream<int> get buildLock => _buildLock.stream;
  final _buildWisdom = BehaviorSubject<int>();
  Stream<int> get buildWisdom => _buildWisdom.stream;
  final _buildProspecting = BehaviorSubject<int>();
  Stream<int> get buildProspecting => _buildProspecting.stream;
  final _buildControl = BehaviorSubject<int>();
  Stream<int> get buildControl => _buildControl.stream;
  final _buildKitSkill = BehaviorSubject<int>();
  Stream<int> get buildKitSkill => _buildKitSkill.stream;
  //Battle Secondary
  final _buildCriticalMastery = BehaviorSubject<int>();
  Stream<int> get buildCriticalMastery => _buildCriticalMastery.stream;
  final _buildCriticalResistance = BehaviorSubject<int>();
  Stream<int> get buildCriticalResistance => _buildCriticalResistance.stream;
  final _buildRearMastery = BehaviorSubject<int>();
  Stream<int> get buildRearMastery => _buildRearMastery.stream;
  final _buildRearResistance = BehaviorSubject<int>();
  Stream<int> get buildRearResistance => _buildRearResistance.stream;
  final _buildMeleeMastery = BehaviorSubject<int>();
  Stream<int> get buildMeleeMastery => _buildMeleeMastery.stream;
  final _buildDistanceMastery = BehaviorSubject<int>();
  Stream<int> get buildDistanceMastery => _buildDistanceMastery.stream;
  final _buildSingleTargetMastery = BehaviorSubject<int>();
  Stream<int> get buildSingleTargetMastery => _buildSingleTargetMastery.stream;
  final _buildAreaMastery = BehaviorSubject<int>();
  Stream<int> get buildAreaMastery => _buildAreaMastery.stream;
  final _buildHealingMastery = BehaviorSubject<int>();
  Stream<int> get buildHealingMastery => _buildHealingMastery.stream;
  final _buildBerserkMastery = BehaviorSubject<int>();
  Stream<int> get buildBerserkMastery => _buildBerserkMastery.stream;

  void setViewBuild(Build build){
    _buildNome.sink.add(_build.name);
    _buildHead.sink.add(_build.classe);
	  _buildAmulId.sink.add(_build.amulId);
    _buildBootId.sink.add(_build.botsId);
    _buildCapaId.sink.add(_build.cloakId);
    _buildCintId.sink.add(_build.beltId);
    _buildDragId.sink.add(_build.dragId);
    _buildElep.sink.add(_build.elementp);
    _buildElmoId.sink.add(_build.elmoId);
    _buildInsId.sink.add(_build.insId);
    _buildMainHId.sink.add(_build.rightHandId);
    _buildSecHId.sink.add(_build.leftHandId);
    _buildLevel.sink.add(_build.nivel);
    _buildRing1Id.sink.add(_build.ring1Id);
    _buildRing2Id.sink.add(_build.ring2Id);
    _buildMontId.sink.add(_build.montId);
    _buildPeitId.sink.add(_build.breastId);
    _buildPetId.sink.add(_build.petId);
    _buildResp.sink.add(_build.resistp);
    //setando atributos
    _buildHP.sink.add(50 + (10*_build.nivel));
    _buildPA.sink.add(6);
    _buildPM.sink.add(3);
    _buildPW.sink.add(6);
    //batalha principais
    _buildWaterDmg.sink.add(0);
    _buildWaterRes.sink.add(0);
    _buildFireDmg.sink.add(0);
    _buildFireRes.sink.add(0);
    _buildAirDmg.sink.add(0);
    _buildAirRes.sink.add(0);
    _buildEarthDmg.sink.add(0);
    _buildEarthRes.sink.add(0);
    //Batalha primario
    _buildFinalDmg.sink.add(0);
    _buildHealPerformed.sink.add(0);
    _buildCriticalHits.sink.add(3);
    _buildBlock.sink.add(0);
    _buildInitiative.sink.add(0);
    _buildRange.sink.add(0);
    _buildDodge.sink.add(0);
    _buildLock.sink.add(0);
    _buildWisdom.sink.add(0);
    _buildProspecting.sink.add(0);
    _buildControl.sink.add(1);
    _buildKitSkill.sink.add(0);
    //Batalha Secundario
    _buildCriticalMastery.sink.add(0);
    _buildCriticalResistance.sink.add(0);
    _buildRearMastery.sink.add(0);
    _buildRearResistance.sink.add(0);
    _buildMeleeMastery.sink.add(0);
    _buildDistanceMastery.sink.add(0);
    _buildSingleTargetMastery.sink.add(0);
    _buildAreaMastery.sink.add(0);
    _buildHealingMastery.sink.add(0);
    _buildBerserkMastery.sink.add(0);
  }

  void publishBuild(){
    print("tocou em publicar");
  }

  void deleteBuild(){
    print("tocou em deletar");
  }

  void shareBuild(){
    print("tocou em share");
  }

  Stream<int> getEspecialStreamByIndex(int index){
    switch(index){
      case 0:
        return buildHP;
      case 1:
        return buildPA;
      case 2:
        return buildPM;
      case 3:
        return buildPW;
      default:
        return buildHP;
    }
  }

  int getItemIdByIndex(int index){
    switch(index){
      case 0:
        return _buildCapaId.value;
      case 1:
        return _buildElmoId.value;
      case 2:
        return _buildDragId.value;
      case 3:
        return _buildAmulId.value;
      case 4:
        return _buildRing1Id.value;
      case 5:
        return _buildRing2Id.value;
      case 6:
        return _buildCintId.value;
      case 7:
        return _buildMainHId.value;
      case 8:
        return _buildSecHId.value;
      case 9:
        return _buildPeitId.value;
      case 10:
        return _buildBootId.value;
      case 11:
        return _buildInsId.value;
      case 12:
        return _buildMontId.value;
      case 13:
        return _buildPetId.value;
      default:
        return _buildPetId.value;
    }
  }

  Stream<int> getStreamByIndex(int index){
    switch(index){
      case 0:
        return buildCapaId;
      case 1:
        return buildElmoId;
      case 2:
        return buildDragId;
      case 3:
        return buildAmulId;
      case 4:
        return buildRing1Id;
      case 5:
        return buildRing2Id;
      case 6:
        return buildCintId;
      case 7:
        return buildMainHId;
      case 8:
        return buildSecHId;
      case 9:
        return buildPeitId;
      case 10:
        return buildBootId;
      case 11:
        return buildInsId;
      case 12:
        return buildMontId;
      case 13:
        return buildPetId;
      default:
        return buildPetId;
    }
  }

  void recalculate(){

  }

  void updateItem(int itemId,int index){
    switch(index){
      case 0:
        _build.cloakId = itemId;
        break;
      case 1:
        _build.elmoId = itemId;
        break;
      case 2:
        _build.dragId = itemId;
        break;
      case 3:
        _build.amulId = itemId;
        break;
      case 4:
        _build.ring1Id = itemId;
        break;
      case 5:
        _build.ring2Id = itemId;
        break;
      case 6:
        _build.beltId = itemId;
        break;
      case 7:
        _build.leftHandId = itemId;
        break;
      case 8:
        _build.rightHandId = itemId;
        break;
      case 9:
        _build.breastId = itemId;
        break;
      case 10:
        _build.botsId = itemId;
        break;
      case 11:
        _build.insId = itemId;
        break;
      case 12:
        _build.montId = itemId;
        break;
      case 13:
        _build.petId = itemId;
        break;
      default:
        _build.petId = itemId;
        break;
    }
    recalculate();
  }
  
  @override
  void dispose() {
    _buildAmulId.close();
    _buildBootId.close();
    _buildCapaId.close();
    _buildCintId.close();
    _buildDragId.close();
    _buildElep.close();
    _buildElmoId.close();
    _buildInsId.close();
    _buildMainHId.close();
    _buildSecHId.close();
    _buildLevel.close();
    _buildRing1Id.close();
    _buildRing2Id.close();
    _buildMontId.close();
    _buildPeitId.close();
    _buildPetId.close();
    _buildResp.close();
    _buildHP.close();
    _buildPM.close();
    _buildPW.close();
    _buildPA.close();
    _buildHead.close();
    _buildNome.close();
    //fechando danos principais
    _buildWaterDmg.close();
    _buildWaterRes.close();
    _buildAirDmg.close();
    _buildAirRes.close();
    _buildFireDmg.close();
    _buildFireRes.close();
    _buildEarthDmg.close();
    _buildEarthRes.close();
    _buildPADmg.close();
    _buildPARes.close();
    //Batalha primario
    _buildFinalDmg.close();
    _buildHealPerformed.close();
    _buildCriticalHits.close();
    _buildBlock.close();
    _buildInitiative.close();
    _buildRange.close();
    _buildDodge.close();
    _buildLock.close();
    _buildWisdom.close();
    _buildProspecting.close();
    _buildControl.close();
    _buildKitSkill.close();
    //Batalha Secundario
    _buildCriticalMastery.close();
    _buildCriticalResistance.close();
    _buildRearMastery.close();
    _buildRearResistance.close();
    _buildMeleeMastery.close();
    _buildDistanceMastery.close();
    _buildSingleTargetMastery.close();
    _buildAreaMastery.close();
    _buildHealingMastery.close();
    _buildBerserkMastery.close();
  }

}