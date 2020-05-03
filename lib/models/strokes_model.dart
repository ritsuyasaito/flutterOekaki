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
import 'dart:io';
import 'package:path_provider/path_provider.dart';


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
    //print(image1);
    print('7777');

    setState(() {
      //image1 = image;
      //_base64 = Base64Encoder(image) as String;
      print(image1);
      print('88888');



    });
  }

  static Future get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print("--");
   // print(directory);
    return directory.path;
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
      var url = 'data:image/png;base64,' + _base64;


      print('####');

      toSlackHook(url);
      print(_base64);
      //_onImageShareButtonPressed(_base64);
      print('####');
      //_onImageShareButtonPressed(byteData.toString());

//      final path = await localPath;
//      final imagePath = '$path/image.png';
//      print("----");
      //print(imagePath);
//      File imageFile = File(imagePath);
//      var savedFile = await imageFile.writeAsBytes(await pngBytes);
//      var bytes = savedFile.readAsBytesSync();
//      _onImageShareButtonPressed(bytes);
      return Image.memory(pngBytes);

    } catch (e) {

      print(e);
    }

    return null;
  }



  void toSlackHook(url) async {
    var slackPostUrl = "https://hooks.slack.com/services/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";

//    var postJson = {
//      "text": "これはりつや"
//      };

    var postJson = {
      "text": "テストです",
      "text": url,
      "image_url": url.toString()

    };
    print(url);

    var response = await http.post(slackPostUrl, body: json.encode(postJson));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(response);
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');

  }

  void toSlack(String filename, String url) async {
  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.files.add(
  http.MultipartFile(
  'picture',
  File(filename).readAsBytes().asStream(),
  File(filename).lengthSync(),
  filename: filename.split("/").last
  )
  );
  var res = await request.send();
}

  void _onImageShareButtonPressed(strData) async {

    var url = 'https://slack.com/api/chat.postMessage';

    var response = await http.post(url, body: {"token": "xoxb-776555160532-1124375822880-s51o1VUCMCAhhUHCkqyvr1Ob",
      "channel": "CNG74R4G2",
      "text": "これはりつや",
      "image": strData});

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
