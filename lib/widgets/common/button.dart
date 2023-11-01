part of '../widget.dart';

final ButtonStyle appTextButtonStyle = ButtonStyle(
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    splashFactory: NoSplash.splashFactory,
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(Size.zero));
