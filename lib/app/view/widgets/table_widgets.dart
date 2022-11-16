import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class THeader extends StatelessWidget {
  final double fontSize;
  final Color textColor, bgColor;
  final EdgeInsetsGeometry padding;

  const THeader({
    Key? key,
    required this.fontSize,
    required this.textColor,
    required this.bgColor,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.sp), topRight: Radius.circular(8.sp)),
          border: Border.all(color: const Color(0xFFF1F3F2), width: 0.9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              'Timestamp',
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              'Summary',
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}

class TRow extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  Color? bgColor;
  EdgeInsetsGeometry? padding;
  BorderRadius? borderRadius;
  final List<String> data;

  TRow(
      {Key? key,
      required this.fontSize,
      required this.textColor,
      this.bgColor,
      this.padding,
      this.borderRadius,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusTextColor = textColor;

    if (data[1] == 'success') {
      statusTextColor = Colors.green;
    } else if (data[1] == 'error') {
      statusTextColor = Colors.redAccent;
    } else if (data[1] == 'timeout') {
      statusTextColor = Colors.amber;
    } else if (data[1] == 'failure') {
      statusTextColor = Colors.orange;
    }

    return Container(
      padding: padding ?? EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          // color: bgColor ?? Colors.grey.withOpacity(0.06),
          borderRadius: borderRadius ?? BorderRadius.zero,
          border: Border.all(color: const Color(0xFFF1F3F2), width: 0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              data[0],
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data[1],
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: statusTextColor.withOpacity(0.6),
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              data[2],
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
