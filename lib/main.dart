import 'package:flutter/material.dart';
import 'package:simple_oekaki/models/strokes_model.dart';
import 'package:simple_oekaki/screens/paper_screen.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'first.dart';
import 'Second.dart';
import 'Share.dart';


import 'models/pen_model.dart';

void main() => runApp(MyApp());

//class MyApp0 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: StartScene(),
//      routes: <String, WidgetBuilder>{
//        '/selectcourse': (BuildContext context) => MyApp(),
//      },
//    );
//  }
//}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(


      providers: [
        ChangeNotifierProvider(
          builder: (BuildContext context) => PenModel(),
        ),
        ChangeNotifierProvider(
          builder: (BuildContext context) => StrokesModel(),
        ),
        ChangeNotifierProvider(
          builder: (BuildContext context) => new _MyHomePageState(),
        ),
      ],
      child: MaterialApp(
        home: SafeArea(
          child: PaperScreen(),
        ),
      ),
    );




  }
}

class _MyHomePageState extends ChangeNotifier {

  // グローバルキー
  GlobalKey _globalKey = GlobalKey();
  // イメージ
  Image _image;

  @override
  Widget build(BuildContext context) {

    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'キャプチャテスト',
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[

              /*
               * 画像表示エリア
               */
              Expanded(
                child: Center(
                  child: Image.network(
                    // "https://www.egao-inc.co.jp/wp-content/uploads/2018/12/aruru02-1.jpg",
                    "https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg",
                  ),
                ),
              ),

              /*
               * キャプチャ表示エリア
               */
              Container(
                color: Colors.yellow,
                height: 200.0,
                child: Center(
                  child: _image != null
                      ? _image
                      : Container(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {

            // キャプチャ開始
            _doCapture();
          },
        ),
      ),
    );
  }

  /*
   * キャプチャ開始
   */
  Future<Null> _doCapture() async {

    var image  = await _convertWidgetToImage();
//
//    setState(() {
//      _image = image;
//    });
  }

  /*
   * _globalKeyが設定されたWidgetから画像を生成し返す
   */
  Future<Image> _convertWidgetToImage() async {
    try {
//      RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
//      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//      var pngBytes = byteData.buffer.asUint8List();
//      return Image.memory(pngBytes);

    } catch (e) {
      print(e);
    }

    return null;
  }
}

class RenderRepaintBoundary {
}
