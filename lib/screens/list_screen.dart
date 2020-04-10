import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todomobx/stores/list_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final TextEditingController controller = TextEditingController();

  ListStore listStore = ListStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>
                                LoginScreen())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              controller: controller,
                              hint: 'Tarefa',
                              onChanged: listStore.SetNewTodoTitle,
                              suffix: listStore.isTitleValid ? CustomIconButton(
                                radius: 32,
                                iconData: Icons.add,
                                onTap: () {
                                  listStore.addTodo();
                                  // Executa o que ta dentro depois de renderizar todos os widgets
                                  WidgetsBinding.instance.addPostFrameCallback(
                                      (_) => controller.clear()
                                  );
                                },
                              ) : null,
                            );
                          },
                        ),
                        const SizedBox(height: 8,),
                        Expanded(
                            child: Observer(
                              builder: (_) {
                                return ListView.separated(
                                  itemCount: listStore.todoList.length,
                                  itemBuilder: (_, index) {
                                    return Observer(
                                      builder: (_) {
                                        return ListTile(
                                          title: Text(
                                            listStore.todoList[index].title,
                                            style: TextStyle(
                                                decoration: listStore
                                                    .todoList[index].done
                                                    ?
                                                TextDecoration.lineThrough
                                                    : null,
                                                color: listStore.todoList[index]
                                                    .done ?
                                                Colors.grey : Colors.black
                                            ),
                                          ),
                                          onTap: listStore.todoList[index]
                                              .toggleDone,
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return Divider();
                                  },
                                );
                              },
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}