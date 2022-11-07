import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String appName = 'Heroku Wake Up';
const String appLogo = 'assets/icon/ic_launcher.png';

const String developerName = 'Md. Imam Hossain';
const String designerName = 'Md. Imam Hossain';

const String feedbackMail = 'mailto:imamagun94@gmail.com';
const String contactMail = 'mailto:imamagun94@gmail.com';

const String appLink =
    'https://play.google.com/store/apps/details?id=com.newagedevs.heroku_wake_up';
const String storeLink =
    'https://play.google.com/store/apps/developer?id=NewAgeDevs';
const String privacyPolicyUrl = '';

// Test ads unit id Google
// const String idBanner = "ca-app-pub-3940256099942544/6300978111";
// const String idInterstitial = "ca-app-pub-3940256099942544/1033173712";

const scaffoldBackgroundLight = Color(0xFFF6F7F8);
const scaffoldBackgroundDark = Color(0xFF212230);
const backgroundLight = Color(0xFFFFFFFF);
const backgroundDark = Color(0xFF323647);
const colorButtonDisable = Color(0xFFB1BCD0);

const colorOnPrimary = Color(0xFF010A1C);
const colorSecondary = Color(0xFFFF2323);
const colorOnSecondary = Color(0xFFFFFFFF);
const colorOnPrimaryDark = Color(0xFFF8F8F8);
const colorSecondaryDark = Color(0xFFFF2323);
const colorOnSecondaryDark = Color(0xFFF8F8F8);

SystemUiOverlayStyle mainPageSystemOverlay(Brightness brightness) =>
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: brightness == Brightness.dark
          ? scaffoldBackgroundLight
          : scaffoldBackgroundDark,
      systemNavigationBarIconBrightness: brightness,
      statusBarColor: brightness == Brightness.dark
          ? scaffoldBackgroundLight
          : scaffoldBackgroundDark,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
    );
