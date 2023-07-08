import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RahyabTextField extends StatelessWidget {
  const RahyabTextField({
    Key? key,
    this.hintText,
    this.inputType,
    this.controller,
    this.validator,
    this.labelText,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.borderColor,
    this.hintColor,
    this.labelColor,
    this.textColor,
    this.inputFormatters,
    this.suffixText,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);
  final String? hintText;
  final String? labelText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? suffixText;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: TextFormField(
        onTap: onTap,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        readOnly: readOnly,
        minLines: minLines,
        maxLength: maxLength,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        keyboardType: inputType,
        textInputAction: textInputAction,
        style:const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          counterStyle:const TextStyle (color: Colors.white, fontSize: 12),
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          suffixIcon: suffixIcon,
          labelText: labelText,
          suffixText: suffixText,
          labelStyle:
              const TextStyle(color: Colors.white, fontSize: 12),
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white70,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
