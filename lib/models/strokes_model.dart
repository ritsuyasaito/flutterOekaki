import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:simple_oekaki/models/pen_model.dart';
import 'dart:convert'; //
import 'dart:typed_data'; //
import 'dart:ui' as ui; //

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_oekaki/screens/paper_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Image image1;

class StrokesModel extends ChangeNotifier {
  //GlobalKey globalKey = new GlobalKey(); //**グローバルキー作成

  List<Stroke> _strokes = [];

  get all => _strokes;

  void add(PenModel pen, Offset offset) {
    _strokes.add(Stroke(pen.color)..add(offset));
    notifyListeners();
  }

  void update(Offset offset) {
    _strokes.last.add(offset);
    notifyListeners();
  }

  void clear() {
    _strokes = [];
    notifyListeners();
  }

  void undo() {

    _strokes.removeLast();
    notifyListeners();
  }
  void redo() {

    _strokes.clear();
    notifyListeners();
  }

  Future<Null> doCapture() async {
    //えりかさんに聞く

    //var image  = await _convertWidgetToImage();
    image1 = await _convertWidgetToImage();
    print(image1);
    print('7777');

    setState(() {
      //image1 = image;
      //_base64 = Base64Encoder(image) as String;
      print(image1);
      print('88888');



    });
  }
  Future<Image> _convertWidgetToImage() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      //png形式化
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      //バイトデータ化
      var pngBytes = byteData.buffer.asUint8List();
      // final _base64 = base64.encode(utf8.encode(pngBytes.toString()));
      final _base64 = base64Encode(pngBytes);


      print('####');
      print(byteData.elementSizeInBytes);
      print(byteData.hashCode);

      print(_base64);
      _onImageShareButtonPressed(_base64);
      print('####');
      return Image.memory(pngBytes);

    } catch (e) {

      print(e);
    }

    return null;
  }

  void _onImageShareButtonPressed(strData) async {



    var url = 'https://slack.com/api/chat.postMessage';

    var response = await http.post(url, body: {"token": "xoxb-776555160532-1124375822880-dW6DypgGhMPkZfNN6CQP2Cd9",
      "channel": "CNG74R4G2",
      "text": strData});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


  }

//**  4. ボタンが押された際の処理 statefulにかく
  void exportToImage() async {

      // 現在描画されているWidgetを取得する
      RenderRepaintBoundary boundary =
      globalKey.currentContext.findRenderObject();

      // 取得したWidgetからイメージファイルをキャプチャする
      ui.Image image = await boundary.toImage(
        pixelRatio: 3.0,
      );

      // 以下はお好みut
      // PNG形式化
      ByteData byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      // バイトデータ化
      final _pngBytes = byteData.buffer.asUint8List();
      // BASE64形式化
      //final _base64 = base64Encode(_pngBytes);

      final _base64 = base64.encode(utf8.encode(_pngBytes.toString()));

      print(byteData);

    }


    notifyListeners();

  void setState(Null Function() param0) {}

}

class Stroke {
  final List<Offset> points = [];
  final Color color;

  Stroke(this.color);

  add(Offset offset) {
    points.add(offset);
  }
}
