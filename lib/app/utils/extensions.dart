import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';


String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

String convertTime(String minutes) {
  if (minutes.length == 1) {
    return "0$minutes";
  } else {
    return minutes;
  }
}


String time12to24Format(String time) {
// var time = "12:01 AM";
  int h = int.parse(time.split(":").first);
  int m = int.parse(time.split(":").last.split(" ").first);
  String meridium = time.split(":").last.split(" ").last.toLowerCase();
  if (meridium == "pm") {
    if (h != 12) {
      h = h + 12;
    }
  }
  if (meridium == "am") {
    if (h == 12) {
      h = 00;
    }
  }
  String newTime = "${h == 0 ? "00" : h.toString().length == 1? '0$h':h}:${m == 0 ? "00" : m.toString().length == 1? '0$m':m}";

  return newTime;
}

void showAboutDialogue(BuildContext context) async {
  return showDialog(
    barrierColor: Colors.black12,
    context: context,
    barrierDismissible: true,
    useSafeArea: true,
    builder: (context) {
      return Center(
        child: Wrap(children: [
          Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset.zero)
                ]),
            child: Column(
              children: [
                const Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8,),
                const Divider(thickness: 1,),
                aboutDialogueItem('App Developer:', developerName),
                const Divider(),
                aboutDialogueItem('Designer Name:', designerName),
                const Divider(),
                aboutDialogueItem('App Icon:', "fontawesome.com,\nsvgrepo.com"),
                const Divider(),
                aboutDialogueItem('Database:', "github.com/WSAyan/medicinedb"),
              ],
            ),
          ),
        ]),
      );
    },
  );
}

Widget aboutDialogueItem(String title, String description) {
  return SizedBox(
    height: 30,
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        //const Spacer(),
        Expanded(
          flex: 2,
          child: Text(
            description,
            //textAlign: TextAlign.justify,
            style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 14,
              color: Colors.black54,
            ),),
        )
      ],
    ),
  );
}

Widget emptyScreen(String message) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
            '',
            height: 80,
            width: 80,
            color: const Color(0xFF172B4D),
            semanticsLabel: 'Open Pill'
        ),
        const SizedBox(height: 30,),
        Text(message, style: TextStyle(fontSize: 11.sp),),
      ],
    ),
  );
}

void showRatingDialogue(BuildContext context) async {
  return showDialog(
    barrierColor: Colors.black12,
    context: context,
    barrierDismissible: true,
    useSafeArea: true,
    builder: (context) {
      return Center(
        child: Wrap(children: [
          Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset.zero)
                ]),
            child: Column(
              children: [
                const Text(
                  'Rate The App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8,),
                const Divider(thickness: 1,),
                const SizedBox(height: 8,),
                const Text(
                  "Please rate the app 5 stars on Google Play to help spread the world!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: Color(0xFFF5365C),
                    ),
                    onRatingUpdate: (rating) async{
                      if(rating == 5){
                        Get.back();
                        String url = appLink;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }else{
                        Get.back();
                        showMessage('Thank you for the rating!');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      );
    },
  );
}


void showMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: hourOfPeriod);
    //MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer..write(time.format(context))..write(' ');
      // ..write(
      //   period == DayPeriod.am
      //       ? localizations.anteMeridiemAbbreviation
      //       : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }
}


