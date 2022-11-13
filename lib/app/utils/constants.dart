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

var colorList = [
  0xFF85B1C5,
  0xFF7E5175,
  0xFF1B1C88,
  0xFF0E27E0,
  0xFF0A6750,
  0xFFB55492,
  0xFFB8A420,
  0xFFD4D6C0,
  0xFF571533,
  0xFF8E4F54,
  0xFF3C9B85,
  0xFF03A1DA,
  0xFF30626F,
  0xFF4BD07B,
  0xFF32230B,
  0xFFA0B495,
  0xFF06AC14,
  0xFF84DBF2,
  0xFF445BB2,
  0xFF65810C,
  0xFF1DE77A,
  0xFF2122B8,
  0xFF80E0D6,
  0xFF504537,
  0xFF250724,
  0xFF8C06CF,
  0xFFA00A3D,
  0xFF0A66A1,
  0xFF28760A,
  0xFFF165EE,
  0xFFCAB07F,
  0xFFB3259C,
  0xFF056108,
  0xFF475985,
  0xFF76A589,
  0xFF05CB20,
  0xFFFF284B,
  0xFFE376E4,
  0xFFA6CDC7,
  0xFF01665B,
  0xFFDC18F3,
  0xFF978243,
  0xFFEE892D,
  0xFF5C557D,
  0xFF7B9789,
  0xFF053CF4,
  0xFFC77796,
  0xFF31BD2C,
  0xFFFBEE3C,
  0xFFC01677,
  0xFFB44688,
  0xFFDA91CC,
  0xFF5C81F0,
  0xFFE17238,
  0xFFDE9A53,
  0xFF4CC9C2,
  0xFFF2B7B4,
  0xFF073455,
  0xFFDB189D,
  0xFFB98CD4,
  0xFF6154A0,
  0xFF209595,
  0xFFB7AC88,
  0xFFA02A8C,
  0xFFF32AEF,
  0xFFAEA10A,
  0xFF5EDD9D,
  0xFF8EE139,
  0xFF8DF5A2,
  0xFF8ABA67,
  0xFF2A910A,
  0xFFF2BBE5,
  0xFF08297E,
  0xFF50BC95,
  0xFFC33F0E,
  0xFF374AD1,
  0xFF6AD981,
  0xFF7AFE14,
  0xFFAE4357,
  0xFFAC3EA3,
  0xFFB6655E,
  0xFF9DD316,
  0xFFD7DBC4,
  0xFF7DE63E,
  0xFF769688,
  0xFFC5914E,
  0xFF2BFC16,
  0xFFAFF5A5,
  0xFFAF1F06,
  0xFFC36779,
  0xFFBB7E01,
  0xFFA050EC,
  0xFF3351D2,
  0xFF6F03BB,
  0xFFD32069,
  0xFF735F95,
  0xFFFFA09D,
  0xFFA7B7DE,
  0xFFC5AF91,
  0xFFF899F5,
  0xFF32A427,
  0xFFBC3EE4,
  0xFF830361,
  0xFF19AE2A,
  0xFF5F7D93,
  0xFF19D555,
  0xFF09B1A6,
  0xFF1E0A5D,
  0xFFA454F2,
  0xFF806FE1,
  0xFFB595A8,
  0xFF64D4EA,
  0xFFFF96C7,
  0xFFC03196,
  0xFF350E27,
  0xFF01850C,
  0xFFD580E9,
  0xFF05731E,
  0xFF340AFE,
  0xFF5B8B40,
  0xFFEE05A0,
  0xFFDB73D6,
  0xFF634E65,
  0xFF6480D7,
  0xFF6F7F5F,
  0xFF24B25C,
  0xFF13EB13,
  0xFFAAA931,
  0xFF7D86A3,
  0xFFE8DBB0,
  0xFF8BB1B4,
  0xFF006AA3,
  0xFF4D54CD,
  0xFF758896,
  0xFFEBA733,
  0xFF9A8E85,
  0xFFE21569,
  0xFF492FFA,
  0xFF5BAB1A,
  0xFF9509A5,
  0xFF303B88,
  0xFFB7EDB4,
  0xFFE8FB86,
  0xFFAA3C74,
  0xFF55C423,
  0xFFC03CB1,
  0xFFDA7758,
  0xFF162DF7,
  0xFF839430,
  0xFFF88D65,
  0xFF67840C,
  0xFF0B650E,
  0xFFB16D9A,
  0xFF3185AC,
  0xFF358BA1,
  0xFF7F0043,
  0xFFDA70FD,
  0xFF92AD32,
  0xFFEB70AA,
  0xFFCC4343
];
