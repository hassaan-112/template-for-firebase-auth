import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../data/appExceptions.dart';
import '../res/colors/appColors.dart';
class Utils {

  static Scankbar(String title, String message){
    Get.snackbar(title, message);
  }


  static toast(String message,Color color){
    Fluttertoast.showToast(msg: message,toastLength: Toast.LENGTH_SHORT,backgroundColor: color);
  }

  static void fieldFocusChange(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){

    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  //time util return time in string
  static String timeToString(DateTime time){
    String hour=time.hour.toString().padLeft(2,'0');
    String minute=time.minute.toString().padLeft(2,'0');
    String second=time.second.toString().padLeft(2,'0');
    return "$hour:$minute:$second";
  }

  //date util return date in string
  static String dateToString(DateTime date){
    String day=date.day.toString().padLeft(2,'0');
    String month=date.month.toString().padLeft(2,'0');
    String year=date.year.toString().padLeft(2,'0');
    return "$day/$month/$year";
  }

  // time in am pm with 12 hours
  static String timeToAmPm(DateTime time){
    String? hour=time.hour.toString().padLeft(2,'0');
    String minute=time.minute.toString().padLeft(2,'0');
    String second=time.second.toString().padLeft(2,'0');
    String amPm=time.hour>=12?"PM":"AM";
    hour = (time.hour>=12?time.hour==12?'12':(time.hour-12).toString():time.hour.toString());
    return "$hour:$minute:$second $amPm";
  }
  // return date in string  from timestamp

  static void handleException(dynamic error) {
    if (error is TimeoutException) {
      Utils.toast(TimeOutExceptions('timeout'.tr).toString(), AppColors.negativeRed);
    } else if (error.toString().contains('network error')) {
      Utils.toast(InternetExceptions('No internet connection').toString(), AppColors.negativeRed);
    } else if (error is BadRequestException) {
      Utils.toast(BadRequestException('badRequest'.tr).toString(), AppColors.negativeRed);
    }else if (error.toString().contains('already in use')) {
      Utils.toast("inUse".tr, AppColors.negativeRed);
    } else if (error.toString().contains('Password should be at least 6 characters')) {
      Utils.toast("shortPassword".tr, AppColors.negativeRed);
    }else if (error.toString().contains('credential is incorrect')) {
      Utils.toast("inCorrect".tr, AppColors.negativeRed);
    } else {
      Utils.toast(OtherExceptions(error.toString()).toString(), AppColors.negativeRed);
    }
  }


}