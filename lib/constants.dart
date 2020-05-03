import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 15.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kCtrlButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 12.0,
  height: 1.1,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kShiftButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 12.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kSpaceButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 12.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kSizedBoxWidth = 25.0;
const kSizedBoxHeight = 25.0;
final kStartTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  color: Colors.white.withOpacity(0.8),
  fontWeight: FontWeight.w600,
  fontSize: 60.0,
);
final kJapTextStyle = TextStyle(
  fontFamily: 'MPLUS',
  color: Colors.white.withOpacity(0.8),
  fontWeight: FontWeight.w600,
  fontSize: 60.0,
);
const kRaisedButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);
final kAlertContainer = Container(
  height: 70.0,
  padding: EdgeInsets.only(top: 20.0),
  child: Column(
    children: <Widget>[
      Text(
        'コース選択へ戻ります',
        style: TextStyle(color: Colors.black45),
      ),
      Text(
        'よろしいですか？',
        style: TextStyle(color: Colors.black45),
      ),
    ],
  ),
);
final kGradientDecoration = BoxDecoration(
  border: Border.all(color: Colors.black45, width: 10.0),
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    colors: [
      const Color(0xff80d8ff), //透明度
      const Color(0xffffe57f), //透明度
    ],
  ),
);
