import 'package:flutter/material.dart';
import 'constants.dart';

class StartScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              const Color(0xfff50057).withOpacity(0.9), //透明度
              const Color(0xff18ffff), //透明度
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ShortCut',
                style: kStartTextStyle,
              ),
              Text(
                'Key',
                style: kStartTextStyle,
              ),
              Text(
                'Challange',
                style: kStartTextStyle,
              ),
              SizedBox(
                height: 80.0,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 80.0,
                child: RaisedButton(
                  child: Text(
                    "- start -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/selectcourse');
                  },
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
