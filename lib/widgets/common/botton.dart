import 'package:flutter/material.dart';

enum ButtonThemeVersion { v1, v2 }

class Button extends StatelessWidget {
  final String title;
  final TextStyle? titelStyle;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final Widget? leading;
  final IconData? leadingIcon;
  final Widget? trailing;
  final double? width;
  final double? height;
  final EdgeInsets? contentPadding;
  final double? iconSize;
  final ButtonThemeVersion buttonTheme;
  final BoxDecoration? decoration;

  const Button({
    Key? key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.titleColor,
    this.width,
    this.height,
    this.contentPadding,
    this.leading,
    this.trailing,
    this.titelStyle,
    this.iconSize,
    this.buttonTheme = ButtonThemeVersion.v1,
    this.decoration,
  })  : leadingIcon = null,
        iconColor = null,
        super(key: key);

  const Button.v2({
    Key? key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.titleColor,
    this.width,
    this.height,
    this.contentPadding,
    this.leading,
    this.trailing,
    this.titelStyle,
    this.iconSize,
    this.buttonTheme = ButtonThemeVersion.v2,
    this.decoration,
  })  : leadingIcon = null,
        iconColor = null,
        super(key: key);

  const Button.leading(
      {Key? key,
      required this.title,
      this.titelStyle,
      this.width,
      this.height,
      this.onTap,
      this.backgroundColor,
      this.titleColor,
      this.contentPadding,
      required this.leading,
      this.iconSize,
      this.buttonTheme = ButtonThemeVersion.v1,
      this.decoration})
      : trailing = null,
        leadingIcon = null,
        iconColor = null,
        super(key: key);

  const Button.leadingIcon(
      {Key? key,
      required this.title,
      this.titelStyle,
      this.width,
      this.height,
      this.onTap,
      this.backgroundColor,
      this.titleColor,
      this.contentPadding,
      this.iconColor,
      this.iconSize,
      required this.leadingIcon,
      this.buttonTheme = ButtonThemeVersion.v1,
      this.decoration})
      : trailing = null,
        leading = null,
        super(key: key);

  const Button.trailing(
      {Key? key,
      required this.title,
      this.onTap,
      this.titelStyle,
      this.backgroundColor,
      this.width,
      this.height,
      this.titleColor,
      this.contentPadding,
      required this.trailing,
      this.iconSize,
      this.buttonTheme = ButtonThemeVersion.v1,
      this.decoration})
      : leading = null,
        leadingIcon = null,
        iconColor = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorForIcon = iconColor ?? titleColor;
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: decoration,
        child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(
              onTap == null
                  ? Colors.grey
                  : backgroundColor ??
                      (buttonTheme == ButtonThemeVersion.v1
                          ? Colors.greenAccent
                          : Colors.white),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
          child: Padding(
            padding: contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 10)],
                if (leadingIcon != null) ...[
                  Icon(
                    leadingIcon,
                    size: iconSize,
                    color: onTap == null || titleColor == null
                        ? Colors.white
                        : colorForIcon,
                  ),
                  const SizedBox(width: 10)
                ],
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: onTap == null || titleColor == null
                            ? Colors.white
                            : titleColor,
                        fontSize: 16,
                        overflow: TextOverflow.fade),
                  ),
                ),
                if (trailing != null) ...[const SizedBox(width: 10), trailing!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
