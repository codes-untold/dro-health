
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum productEvent {addition,update,deletion}


class ProductBloc extends Bloc<productEvent,List<Map<String,dynamic>>>{
  ProductBloc(List<Map<String, dynamic>> initialState) : super(initialState);

  @override
  // TODO: implement initialState
  List<Map<String, dynamic>> get initialState => [];

  Map<String,dynamic> _map;
  int _index;

  @override
  Stream<List<Map<String, dynamic>>> mapEventToState(productEvent event) async*{
    // TODO: implement mapEventToState
    switch(event){
      case productEvent.addition:
        state.add(_map);
        break;
      case productEvent.update:
        state[_index] = _map;

        break;
      case productEvent.deletion:
        state.removeAt(_index);
        break;
    }
    yield state;
  }

  void addProduct(Map<String,dynamic> map){
    _map = map;
    add(productEvent.addition);

  }

  void updateProduct(int index,Map<String,dynamic> map){
    _map = map;
    _index = index;
    add(productEvent.update);
  }

  void deleteProduct(int index){
    _index = index;
    add(productEvent.deletion);
  }
}