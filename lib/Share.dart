import 'dart:convert'; //
import 'dart:typed_data'; //
import 'dart:ui' as ui; //

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  //動的デザイン
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //createstateに入る部分
  int _counter = 0; //フィールド（ローカル関数）
  GlobalKey _globalKey = new GlobalKey(); //**グローバルキー作成

  void _incrementCounter() {
    //下で呼び出される
    //状態の保持と更新ができる
    setState(() {
      //状態の更新処理を記述
      _counter++;
    });
  }

  //**  4. ボタンが押された際の処理
  void _exportToImage() async {
    // 現在描画されているWidgetを取得する
    RenderRepaintBoundary boundary =
    _globalKey.currentContext.findRenderObject();

    // 取得したWidgetからイメージファイルをキャプチャする
    ui.Image image = await boundary.toImage(
      pixelRatio: 3.0,
    );

    // 以下はお好み
    // PNG形式化
    ByteData byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    // バイトデータ化
    final _pngBytes = byteData.buffer.asUint8List();
    // BASE64形式化
    final _base64 = base64Encode(_pngBytes);
    print(_base64);
  }

  @override
  Widget build(BuildContext context) {
    //以下ビルドメソッド(widgetの組み合わせ)
    return RepaintBoundary(
      // 2. 画面全体をキャプチャするならScaffoldを囲ってやる
      key: _globalKey, // 3. GlobalKeyを割り当てて子のボタンからアクセスできるようにしてやる
      child: Scaffold(
        //ページごとに囲む
        appBar: AppBar(
          //上のナビバー
          title: Text(widget.title),
        ),
        body: Center(
          //centerで中央に、centerもcolumnもwidget
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                //テキスト表示
                'You have pushed the button this many times:',
              ),
              Text(
                //textwidget
                '$_counter', //カウントの表示
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                'Widget to Image sample.',
              ),
              RaisedButton(
                onPressed: _exportToImage,
                child: Icon(
                  Icons.image,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //ここがボタン
          onPressed: _incrementCounter, //ボタン押した時に呼ばれる
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}


