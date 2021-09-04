import 'package:flutter/material.dart';
import 'package:todo_list/todo.dart';

import 'package:todo_list/new_todo_dialog.dart';
import 'package:todo_list/todo_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  //List<Todo> todos = [];//このリストに格納されたものが表示される
  List<Todo> todos_lst = [//最初から中身を入れておく場合
    Todo(title: 'Sample1'),
    Todo(title: 'Sample2'),
  ];

  List<Todo> todos2 = [//最初から中身を入れておく場合
    Todo(title: 'Sample1'),
    Todo(title: 'Sample2'),
  ];


  _toggleTodo(Todo todo_text, bool isChecked) {
    setState(() {
      todo_text.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    //何かしら返しがあれば登録するでなければ追加する
    if (todo != null) {
      //setStateでリストのものを追加する
      //setSateは、更新を呼び出すmethod。呼び出されない限り更新されない
      //https://qiita.com/koizumiim/items/5cc0f68d224b2cc949ba
      setState(() {
        todos_lst.add(todo);
      });
    }
  }

  //メイン画面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //アプリ名表示
      appBar: AppBar(title: Text('配当・優待管理')),
      //画面表示
      body: TodoList(
        todos: todos_lst,
        onTodoToggle: _toggleTodo,
      ),
      //下に追加ボタンを入れる
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
