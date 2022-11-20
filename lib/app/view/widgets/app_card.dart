import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroku_wake_up/app/model/heroku_app.dart';
import 'package:sizer/sizer.dart';

Widget appCard(
        {required HerokuApp app,
        required Color cardColor,
        required Color statusColor,
          required int animDuration,
        required Future<bool?> Function(DismissDirection)? confirmDismiss}) =>
    FadeInUp(
      duration: Duration(milliseconds: animDuration),
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp, bottom: 8.sp),
        child: Dismissible(
          key: Key(app.id),
          background: slideBackground(
            bgColor: Colors.green,
            iconPath: "assets/icon/edit.svg",
            text: "Edit",
            mainAxisAlignment: MainAxisAlignment.start,
            textAlign: TextAlign.left,
            alignment: Alignment.centerLeft,
          ),
          secondaryBackground: slideBackground(
            bgColor: Colors.red,
            iconPath: "assets/icon/trash.svg",
            text: "Delete",
            mainAxisAlignment: MainAxisAlignment.end,
            textAlign: TextAlign.right,
            alignment: Alignment.centerRight,
          ),
          confirmDismiss: confirmDismiss,
          child: Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: cardColor, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                SvgPicture.asset("assets/icon/heroku_icon.svg",
                    height: 20.sp,
                    width: 20.sp,
                    color: const Color(0xCC613C96),
                    semanticsLabel: 'icon'),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      'Give me ${app.wakingUpTimes.length} cups of coffee every day if you can',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: Colors.black45,
                      ),
                    )
                  ],
                )),
                Container(
                  width: 8.sp,
                  height: 8.sp,
                  decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: statusColor, width: 1.sp)),
                )
              ],
            ),
          ),
        ),
      ),
    );

Widget slideBackground({
  required Color bgColor,
  required String iconPath,
  required String text,
  required MainAxisAlignment mainAxisAlignment,
  required TextAlign textAlign,
  required Alignment alignment,
}) {
  return Container(
    decoration:
        BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
    child: Align(
      alignment: alignment,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          SizedBox(
            width: 15.sp,
          ),
          SvgPicture.asset(iconPath,
              height: 14.sp,
              width: 14.sp,
              color: Colors.white,
              semanticsLabel: ''),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            " $text",
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: textAlign,
          ),
          SizedBox(
            width: 15.sp,
          ),
        ],
      ),
    ),
  );
}
