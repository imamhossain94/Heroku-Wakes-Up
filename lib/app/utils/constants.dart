import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String appName = 'Heroku Wake Up';
const String appLogo = 'assets/icon/ic_launcher.png';

const String developerName = 'Md. Imam Hossain';
const String designerName = 'Md. Imam Hossain';

const String feedbackMail = 'mailto:imamagun94@gmail.com';
const String contactMail = 'mailto:imamagun94@gmail.com';

const String sourceCodeLink =
    'https://github.com/imamhossain94/Heroku-Wakes-Up';
// const String appLink = 'market://details?id=com.newagedevs.heroku_wake_up';
// const String storeLink = 'market://developer?id=NewAgeDevs';
const String appLink =
    'https://play.google.com/store/apps/details?id=com.newagedevs.heroku_wake_up';
const String storeLink =
    'https://play.google.com/store/apps/developer?id=NewAgeDevs';
const String websiteUrl = 'https://newagedevs.com/';
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

var hours = [for (var i = 1; i <= 12; i++) '$i'];
var minutes = [for (var i = 0; i < 60; i++) i < 10 ? '0$i' : '$i'];
var meridiem = ['AM', 'PM'];

// var intervalHours = [for (var i = 1; i <= 12; i++) '$i'];
// var intervalMinutes = ['15', '30'];
var intervalHourOrMinute = ['H', 'M'];

var sleepingHours = 0;

List<Color> colorList = [
  const Color(0x3385b1c5),
  const Color(0x337e5175),
  const Color(0x331b1c88),
  const Color(0x330e27e0),
  const Color(0x330a6750),
  const Color(0x33b55492),
  const Color(0x33b8a420),
  const Color(0x33d4d6c0),
  const Color(0x33571533),
  const Color(0x338e4f54),
  const Color(0x333c9b85),
  const Color(0x3303a1da),
  const Color(0x3330626f),
  const Color(0x334bd07b),
  const Color(0x3332230b),
  const Color(0x33a0b495),
  const Color(0x3306ac14),
  const Color(0x3384dbf2),
  const Color(0x33445bb2),
  const Color(0x3365810c),
  const Color(0x331de77a),
  const Color(0x332122b8),
  const Color(0x3380e0d6),
  const Color(0x33504537),
  const Color(0x33250724),
  const Color(0x338c06cf),
  const Color(0x33a00a3d),
  const Color(0x330a66a1),
  const Color(0x3328760a),
  const Color(0x33f165ee),
  const Color(0x33cab07f),
  const Color(0x33b3259c),
  const Color(0x33056108),
  const Color(0x33475985),
  const Color(0x3376a589),
  const Color(0x3305cb20),
  const Color(0x33ff284b),
  const Color(0x33e376e4),
  const Color(0x33a6cdc7),
  const Color(0x3301665b),
  const Color(0x33dc18f3),
  const Color(0x33978243),
  const Color(0x33ee892d),
  const Color(0x335c557d),
  const Color(0x337b9789),
  const Color(0x33053cf4),
  const Color(0x33c77796),
  const Color(0x3331bd2c),
  const Color(0x33fbee3c),
  const Color(0x33c01677),
  const Color(0x33b44688),
  const Color(0x33da91cc),
  const Color(0x335c81f0),
  const Color(0x33e17238),
  const Color(0x33de9a53),
  const Color(0x334cc9c2),
  const Color(0x33f2b7b4),
  const Color(0x33073455),
  const Color(0x33db189d),
  const Color(0x33b98cd4),
  const Color(0x336154a0),
  const Color(0x33209595),
  const Color(0x33b7ac88),
  const Color(0x33a02a8c),
  const Color(0x33f32aef),
  const Color(0x33aea10a),
  const Color(0x335edd9d),
  const Color(0x338ee139),
  const Color(0x338df5a2),
  const Color(0x338aba67),
  const Color(0x332a910a),
  const Color(0x33f2bbe5),
  const Color(0x3308297e),
  const Color(0x3350bc95),
  const Color(0x33c33f0e),
  const Color(0x33374ad1),
  const Color(0x336ad981),
  const Color(0x337afe14),
  const Color(0x33ae4357),
  const Color(0x33ac3ea3),
  const Color(0x33b6655e),
  const Color(0x339dd316),
  const Color(0x33d7dbc4),
  const Color(0x337de63e),
  const Color(0x33769688),
  const Color(0x33c5914e),
  const Color(0x332bfc16),
  const Color(0x33aff5a5),
  const Color(0x33af1f06),
  const Color(0x33c36779),
  const Color(0x33bb7e01),
  const Color(0x33a050ec),
  const Color(0x333351d2),
  const Color(0x336f03bb),
  const Color(0x33d32069),
  const Color(0x33735f95),
  const Color(0x33ffa09d),
  const Color(0x33a7b7de),
  const Color(0x33c5af91),
  const Color(0x33f899f5),
  const Color(0x3332a427),
  const Color(0x33bc3ee4),
  const Color(0x33830361),
  const Color(0x3319ae2a),
  const Color(0x335f7d93),
  const Color(0x3319d555),
  const Color(0x3309b1a6),
  const Color(0x331e0a5d),
  const Color(0x33a454f2),
  const Color(0x33806fe1),
  const Color(0x33b595a8),
  const Color(0x3364d4ea),
  const Color(0x33ff96c7),
  const Color(0x33c03196),
  const Color(0x33350e27),
  const Color(0x3301850c),
  const Color(0x33d580e9),
  const Color(0x3305731e),
  const Color(0x33340afe),
  const Color(0x335b8b40),
  const Color(0x33ee05a0),
  const Color(0x33db73d6),
  const Color(0x33634e65),
  const Color(0x336480d7),
  const Color(0x336f7f5f),
  const Color(0x3324b25c),
  const Color(0x3313eb13),
  const Color(0x33aaa931),
  const Color(0x337d86a3),
  const Color(0x33e8dbb0),
  const Color(0x338bb1b4),
  const Color(0x33006aa3),
  const Color(0x334d54cd),
  const Color(0x33758896),
  const Color(0x33eba733),
  const Color(0x339a8e85),
  const Color(0x33e21569),
  const Color(0x33492ffa),
  const Color(0x335bab1a),
  const Color(0x339509a5),
  const Color(0x33303b88),
  const Color(0x33b7edb4),
  const Color(0x33e8fb86),
  const Color(0x33aa3c74),
  const Color(0x3355c423),
  const Color(0x33c03cb1),
  const Color(0x33da7758),
  const Color(0x33162df7),
  const Color(0x33839430),
  const Color(0x33f88d65),
  const Color(0x3367840c),
  const Color(0x330b650e),
  const Color(0x33b16d9a),
  const Color(0x333185ac),
  const Color(0x33358ba1),
  const Color(0x337f0043),
  const Color(0x33da70fd),
  const Color(0x3392ad32),
  const Color(0x33eb70aa),
  const Color(0x33cc4343)
];
