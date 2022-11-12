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
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.sp),
              topRight: Radius.circular(8.sp)
          ),
          border: Border.all(color: const Color(0xFFF1F3F2))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Time',
              textAlign: TextAlign.start,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              textAlign: TextAlign.start,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              'Message',
              textAlign: TextAlign.start,
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
  final Color textColor, bgColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final List<String> data;

  const TRow({
    Key? key,
    required this.fontSize,
    required this.textColor,
    required this.bgColor,
    required this.padding,
    required this.borderRadius,
    required this.data
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          border: Border.all(color: const Color(0xFFF1F3F2))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              data[0],
              textAlign: TextAlign.start,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data[1],
              textAlign: TextAlign.start,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              data[2],
              textAlign: TextAlign.start,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
