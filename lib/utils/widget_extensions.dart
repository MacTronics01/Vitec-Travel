import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: uncomment if using a pdf functionality
// import 'package:pdf/pdf.dart';

const ext = 0;

extension WidgetExtensions on double {
  Widget get sbH => SizedBox(
        height: this.h,
      );

  Widget get sbW => SizedBox(
        width: this.w,
      );

  EdgeInsetsGeometry get padA => EdgeInsets.all(this);

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String decodeErrorMessage(Map map) {
  String? errorMessage = "";
  map.forEach((key, value) {
    errorMessage = errorMessage! +
        "- " +
        map[key].toString().replaceAll("]", "").replaceAll("[", "") +
        "\n";
  });
  return errorMessage!;
}
