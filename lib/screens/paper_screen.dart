import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_oekaki/components/palette.dart';
import 'package:simple_oekaki/components/paper.dart';
import 'package:simple_oekaki/models/strokes_model.dart';
import 'dart:convert'; //
import 'dart:typed_data'; //
import 'dart:ui' as ui; //

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_oekaki/models/pen_model.dart';

GlobalKey globalKey = new GlobalKey(); //**グローバルキー作成

class PaperScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final strokes = Provider.of<StrokesModel>(context);
    // キャプられる
    return RepaintBoundary(
      key: globalKey,

     child: Scaffold(
      body: Stack(
        children: <Widget>[
          Paper(),
          Align(
            alignment: Alignment.topLeft,
            child: Palette(),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('削除します'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () {


                          strokes.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),

          FloatingActionButton(
            child: Icon(Icons.undo),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('1つ前に戻します'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () {
                          strokes.undo();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.share),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('シェアしますか'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('OK'),
                        onPressed: () {

                         // strokes.exportToImage();
                          strokes.doCapture();


                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),




        ],
      )
    ),

    );

  }
}

