import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum ButtonSize { small, medium, large }

class RahyabButton extends StatelessWidget {
  const RahyabButton({
    Key? key,
    required this.buttonName,
    this.onTap,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
    this.height,
    this.buttonSize = ButtonSize.small,
  }) : super(key: key);
  final String buttonName;
  final Function()? onTap;
  final Color? bgColor;
  final Color? textColor;
  final bool isLoading;
  final double? height;
  final ButtonSize buttonSize;

  double width(ButtonSize buttonSize, BuildContext context) {
    if (buttonSize == ButtonSize.large) {
      return MediaQuery.of(context).size.width * 0.9;
    } else if (buttonSize == ButtonSize.medium) {
      return MediaQuery.of(context).size.width * 0.5;
    } else {
      return MediaQuery.of(context).size.width * 0.3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width(buttonSize, context),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.black12,
          ),
        ),
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? LoadingAnimationWidget.threeArchedCircle(
            color: Colors.black, size: 32)
            : Text(
          buttonName,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
