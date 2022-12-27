import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:set_up1/utils/palette.dart';

import '../../core/enum/viewState.enum.dart';
import '../utils/keyboard-utils.dart';


class UiButtonOutlined extends StatefulWidget {
  final String text;
  final Function onPressed;
  final ViewState loadingState;
  final Color backgroundColor;
  final Color borderColor;

  UiButtonOutlined({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black87,
    this.loadingState = ViewState.idle,
  }) : super(key: key);

  @override
  _UiButtonOutlinedState createState() => _UiButtonOutlinedState();
}

class _UiButtonOutlinedState extends State<UiButtonOutlined> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
        height: 40,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(color: widget.borderColor,width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              onPrimary: AppColors.transparent.withOpacity(0.5),
              shadowColor:  AppColors.transparent.withOpacity(0.5),
              primary: Colors.transparent),
          onPressed: (widget.loadingState == ViewState.idle)
              ? () {
                  killKeyboard(context);
                  widget.onPressed();
                }
              : null,
          child: widget.loadingState == ViewState.idle
              ? Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: widget.borderColor),
                )
              : const SpinKitPulse(
                  color:  AppColors.green,
                  size: 16.2,
                ),
        )
        );
  }
}
