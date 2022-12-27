import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:set_up1/utils/palette.dart';

class Input extends StatefulWidget {
  final bool? readOnly;
  final bool? enabled;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color color;
  final String? labelText;
  final String? hintText;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? helperText;
  final int? maxLines;
  final Function(String)? onChanged;
  final Widget? suffix;
  final bool? autofocus;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;

  const Input(
      {Key? key,
        this.labelText,
        this.hintText,
        this.onChanged,
        this.color = Colors.black12,
        this.helperText,
        this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.keyboardType,
        this.onTap,
        this.autofocus,
        this.maxLines,
        this.textInputAction = TextInputAction.next,
        this.autocorrect = false,
        this.enableSuggestions = true,
        this.obscureText = false,
        this.suffix,
        this.prefixText,
        this.readOnly = false,
        this.enabled = true,
        this.inputFormatters})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode _focus;
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocus = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 60.0,
            vertical: 2.0,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _isFocus ? AppColors.white : AppColors.white,
            border: Border.all(
              width: 1,
              color: _isFocus ? AppColors.green : widget.color,
            ),
            borderRadius: BorderRadius.circular(40)
          ),
          child: TextFormField(
            enabled: widget.enabled,
            readOnly: widget.readOnly!,
            inputFormatters: widget.inputFormatters ?? [],
            autofocus: widget.autofocus ?? false,
            focusNode: _focus,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            autocorrect: widget.autocorrect ?? true,
            enableSuggestions: widget.enableSuggestions ?? true,
            obscureText: widget.obscureText ?? false,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onTap: widget.onTap,
            decoration: InputDecoration(
              // border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              hintStyle: const TextStyle(
                height: 0,
                fontSize: 15,
              ),
              labelStyle: const TextStyle(
                height: 1,
                fontSize: 15,
              ),
              border: InputBorder.none,
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              prefixText: widget.prefixText,
              prefixIcon: widget.prefixIcon,
              // suffixIconConstraints: BoxConstraints.tight(Size(30.w, 40.h)),
              suffix: widget.suffix,
            ),
          ),
        ),
        if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.helperText!,
              style: const TextStyle(fontSize: 12, color: AppColors.lightGray),
            ),
          )
      ],
    );
  }
}