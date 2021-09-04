import 'package:flutter/material.dart';

import 'package:todo_list/todo.dart';

//https://dev.classmethod.jp/articles/flutter_deprecated_buttons/
//一部のウェジェットが非推奨になった


class NewTodoDialog extends StatelessWidget {
  //https://www.virment.com/flutter-how-to-retrive-textfield-form/
  //TextEditingControllerのコントローラを作成し、後は入力した内容をmyController.textというような形で
  // 取り出すことができます
  //型指定をしないvarを利用することができる
  final _brandname = new TextEditingController();//銘柄名
  final _price = new TextEditingController();//株価

  //追加するためのダイアログ
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('銘柄追加'),
      //テキスト入力部
      content: TextField(
        controller: _brandname,
        //autofocus設定をしておくと、画面を開いたときにキーボードを開くようになる
        autofocus: true,
      ),



      actions: <Widget>[
        TextButton(
          child: Text('キャンセル'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //FlatButton(
        TextButton(
          child: Text('キャンセル'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
        //FlatButton(
          child: Text('追加'),
          onPressed: () {
            //final todo = new Todo(title: controller.value.text);
            //controller.clear();
            final todo = new Todo(title: _brandname.value.text);//値を取り出してtodoに渡す
            _brandname.clear();

            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
