import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:social_wakfu/Bloc/item_bloc.dart';
import 'package:social_wakfu/Bloc/view_build_bloc.dart';
import 'package:social_wakfu/Model/item.dart';

class SelectItemBloc implements BlocBase{
 
  final int _index;
  final ItemBloc _itemBloc;
  final ViewBuildBloc _buildBloc;
  final _equipedItem = BehaviorSubject<Item>();
  Stream<Item> get equipedItem => _equipedItem.stream;

  SelectItemBloc(this._index, this._itemBloc, this._buildBloc);
 
  @override
  void dispose() {
    _equipedItem.close();
  }

  void setEquipedItem({int index, int itemId}) async {
    if(itemId!=null){
      _equipedItem.sink.add(_itemBloc.getItem(itemId));
    }else{
      int equipedItem = await getIdByIndex(index);
      if(equipedItem!=null){
        _equipedItem.sink.add(_itemBloc.getItem(equipedItem));
      }
    }
  }

  List<Item> getItemsByType(int type){
    return List<Item>();
  }

  int getIdByIndex(int index){
    return _buildBloc.getItemIdByIndex(index);
  }

}