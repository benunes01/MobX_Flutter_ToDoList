import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store{

  @observable
  String newTodoTitle = '';

  @action
  void SetNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isTitleValid => newTodoTitle.isNotEmpty;


  ObservableList<String> todoList = ObservableList<String>();

  @action
  void addTodo(){
    todoList.add(newTodoTitle);
  }


}