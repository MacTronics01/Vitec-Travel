import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:set_up1/utils/string-extensions.dart';
import 'package:set_up1/utils/widget_extensions.dart';

import '../utils/palette.dart';

Widget toast(String message, {bool? success}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            height: 50.0,
            color:
                !success! ? const Color(0xffFCE6E7) : Colors.greenAccent.shade100,
            child: Row(
              children: [
                if (!success) const Icon(Icons.error_outline,color: AppColors.red,),
                10.0.sbW,
                Container(
                  margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.only(right: 20.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          message.toUpperCase(),
                          style: TextStyle(
                            color: !success ? Color(0xffBE4D52) : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false, num? time}) {
  // dialogLocation(message: message, success: success, time: time);
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 5),
    onDismiss: () {},
  );
}

void dialogLocation({bool? success = false, String? message, num? time}) async {
  locationDialog({
    required AlignmentGeometry alignment,
    double width = double.infinity,
    double height = 100,
  }) async {
    SmartDialog.show(
      alignment: alignment,
      builder: (_) => Container(
          padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
          width: width,
          height: 200,
          color: success! ? Colors.green.shade300 : Colors.orange,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      message!,
                      style: TextStyle(
                          color:  AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.white,
                    ))
              ],
            ),
          )),
    );
    await Future.delayed(Duration(milliseconds: time?.toInt() ?? 5000));
    SmartDialog.dismiss();
  }

  //bottom
  await locationDialog(height: 100, alignment: Alignment.bottomCenter);
}
