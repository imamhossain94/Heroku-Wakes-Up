
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/heroku_app.dart';
import '../utils/extensions.dart';

class HerokuWakeUpController extends GetxController {

  HerokuApp? herokuApp;
  late TextEditingController appNameTextController;
  late TextEditingController appLinkTextController;

  var time = const TimeOfDay(hour: 0, minute: 00).obs;

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