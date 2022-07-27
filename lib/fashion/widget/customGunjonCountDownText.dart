
import 'package:flutter/material.dart';
class CustomGunjonCountDownText{
  CustomGunjonCountDownText(
      {Key? key,
      required this.due,
      required this.finishedText,
      this.longDateName = false,
      this.style,
      this.showLabel = false,
      this.daysTextLong = " days ",
      this.hoursTextLong = " hours ",
      this.minutesTextLong = " minutes ",
      this.secondsTextLong = " seconds ",
      this.daysTextShort = " d ",
      this.hoursTextShort = " h ",
      this.minutesTextShort = " m ",
      this.secondsTextShort = " s ",});

  final DateTime? due;
  final String? finishedText;
  final bool? longDateName;
  final bool? showLabel;
  final TextStyle? style;
  final String daysTextLong;
  final String hoursTextLong;
  final String minutesTextLong;
  final String secondsTextLong;
  final String daysTextShort;
  final String hoursTextShort;
  final String minutesTextShort;
  final String secondsTextShort;

  String returnTime(String data){
    //String day,String hours,String minute,String secound;
    String duration=CountDown().timeLeft(due!,
          finishedText!,
          daysTextLong,
          hoursTextLong,
          minutesTextLong,
          secondsTextLong,
          daysTextShort,
          hoursTextShort,
          minutesTextShort,
          secondsTextShort,
          longDateName: longDateName, showLabel: showLabel);
          print(duration.length);
      
    // if(data=="day"){
    //   String day='';
    //   for(int i=0;i<2;i++){
    //     day+=duration[i];
    //   }
    //   return day;
    // }
    if(data=="hours"){
      String hours='';
      for(int i=0;i<1;i++){
        hours+=duration[i];
      }
      return hours;
    }
    if(data=="minute"){
      String minute='';
      for(int i=4;i<6;i++){
        minute+=duration[i];
      }
      return minute;
    }
    if(data=="secound"){
      String secound='';
      for(int i=10;i<duration.length;i++){
        secound+=duration[i];
      }
      return secound;
    }
    else {
      throw "Not Found";
    }
  }
}
class CountDown {
  String timeLeft(DateTime due,
      String finishedText,
      String daysTextLong,
      String hoursTextLong,
      String minutesTextLong,
      String secondsTextLong,
      String daysTextShort,
      String hoursTextShort,
      String minutesTextShort,
      String secondsTextShort,
      {bool? longDateName, bool? showLabel}) {
    String retVal = "";
    String retday = "";
    String retHour = "";
    String retMinute = "";
    String retSecound = "";

    Duration _timeUntilDue = due.difference(DateTime.now());

    int _daysUntil = _timeUntilDue.inDays;
    int _hoursUntil = _timeUntilDue.inHours - (_daysUntil * 24);
    int _minUntil =
        _timeUntilDue.inMinutes - (_daysUntil * 24 * 60) - (_hoursUntil * 60);
    int _secUntil = _timeUntilDue.inSeconds - (_minUntil * 60);
    // String s = _secUntil.toString().substring(_secUntil.toString().length - 2);
    // //Fixed Invalid Range Value
    String s = _secUntil.toString().length <= 2
        ? _secUntil.toString()
        : _secUntil.toString().substring(_secUntil.toString().length - 2);

    //Check whether to return longDateName date name or not
    if (showLabel == false){
      if (_daysUntil > 0) {
        retVal += _daysUntil.toString() + " : ";
      
      }
      if (_hoursUntil > 0) {
        retVal += _hoursUntil.toString() + " : ";
    
      }
      if (_minUntil > 0) {
        retVal += _minUntil.toString() + " : ";
    
      }
      if (_secUntil > 0) {
        retVal += s;
      }
    }else {
      if (longDateName == false) {
        if (_daysUntil > 0) {
          retVal += _daysUntil.toString() + daysTextShort;
        }
        if (_hoursUntil > 0) {
          retVal += _hoursUntil.toString() + hoursTextShort;
        }
        if (_minUntil > 0) {
          retVal += _minUntil.toString() + minutesTextShort;
        }
        if (_secUntil > 0) {
          retVal += s + secondsTextShort;
        }
      } else {
        if (_daysUntil > 0) {
          retVal += _daysUntil.toString() + daysTextLong;
        }
        if (_hoursUntil > 0) {
          retVal += _hoursUntil.toString() + hoursTextLong;
        }
        if (_minUntil > 0) {
          retVal += _minUntil.toString() + minutesTextLong;
        }
        if (_secUntil > 0) {
          retVal += s + secondsTextLong;
        }
      }
    }
    if(_secUntil<1){
      retVal = finishedText;
    }
    return retVal;
  }
}