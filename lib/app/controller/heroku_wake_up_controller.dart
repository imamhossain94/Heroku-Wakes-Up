
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/heroku_app.dart';
import '../utils/extensions.dart';

class HerokuWakeUpController extends GetxController {

  HerokuApp? herokuApp;
  late TextEditingController appNameTextController;
  late TextEditingController appLinkTextController;


  var hours = [for (var i = 1; i <= 12; i++) '$i'];
  var minutes = [for (var i = 0; i < 60; i++) i < 10 ? '0$i' : '$i'];
  var meridiem = ['AM', 'PM'];
  var hourOrMinute = ['H', 'M'];

  // Time selector
  var hourIndex = 0.obs;
  var minuteIndex = 0.obs;
  var meridiemIndex = 0.obs;

  // Interval selector
  var intervalHmIndex = 0.obs;
  var intervalHIndex = 0.obs;
  var intervalMIndex = 0.obs;



  @override
  void onInit() {
    appNameTextController = TextEditingController();
    appLinkTextController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    appNameTextController.dispose();
    appLinkTextController.dispose();
    super.dispose();
  }


  void createApp() {

    String appName = appNameTextController.text.toString();
    String appLink = appLinkTextController.text.toString();

    if(appName.isNotEmpty && appLink.isNotEmpty){


    }else{
      showMessage('Error message');
    }

  }






}