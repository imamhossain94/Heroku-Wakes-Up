import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

Widget sectionTitle(
        {required String title,
        VoidCallback? onAddClick,
        VoidCallback? onListClick}) =>
    FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(
            left: 15.sp, right: 10.sp, top: 15.sp, bottom: 5.sp),
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xCC613C96),
              ),
            ),
            const Spacer(),
            if (onListClick != null)
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: onListClick,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: SvgPicture.asset("assets/icon/list.svg",
                        height: 14.sp,
                        width: 14.sp,
                        color: const Color(0xCC613C96),
                        semanticsLabel: 'list'),
                  ),
                ),
              ),
            if (onAddClick != null)
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: onAddClick,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: SvgPicture.asset("assets/icon/plus_square.svg",
                        height: 14.sp,
                        width: 14.sp,
                        color: const Color(0xFF8064A7),
                        semanticsLabel: 'add'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
