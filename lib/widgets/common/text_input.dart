import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatefulWidget {
  final String label;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final Function(String? value)? onChanged;
  final EdgeInsets margin;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Function()? onTap;
  final String? hintText;
  final Color? fillColor;
  final bool isRequired;
  final bool isOptional;
  final TextInputAction? textInputAction;

  const TextInput({
    Key? key,
    Widget? suffixWidget,
    required this.label,
    this.initialValue,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.onChanged,
    this.margin = const EdgeInsets.only(top: 2),
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.fillColor,
    this.isRequired = false,
    this.isOptional = false,
    this.textInputAction,
  })  : suffix = suffixWidget,
        prefix = null,
        super(key: key);

  TextInput.password({
    super.key,
    required this.label,
    Widget? prefix,
    this.initialValue,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.onChanged,
    this.margin = const EdgeInsets.only(top: 2),
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.fillColor,
    Function()? onVisibilityTap,
    this.isRequired = false,
    this.isOptional = false,
    this.textInputAction,
  })  : prefix = null,
        suffix = GestureDetector(
          onTap: onVisibilityTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: !obscureText ? Colors.grey : Colors.grey,
            ),
          ),
        );

  TextInput.prefixText({
    super.key,
    required this.label,
    required String text,
    this.initialValue,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.enabled = true,
    this.onChanged,
    this.margin = const EdgeInsets.only(top: 2),
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.fillColor,
    Function()? onVisibilityTap,
    this.isRequired = false,
    this.isOptional = false,
    this.textInputAction,
  })  : prefix = Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 1),
          constraints: const BoxConstraints(
            maxWidth: 30,
          ),
          child: Text(
            text,
          ),
        ),
        suffix = null;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _hasError = false;
  bool get _hasFocus => _focusNode.hasFocus;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {
        String? textController = widget.controller?.text;
        String? errorMessage = widget.validator?.call(textController);
        _hasError = errorMessage != null;
      });
    });
    _focusNode = FocusNode()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(covariant TextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {});
    }
  }

  Color _getFocusColor({Color? unfocusColor}) {
    if (_hasError) {
      return Colors.red;
    } else if (_hasFocus && !widget.readOnly && widget.enabled) {
      return Colors.greenAccent;
    }
    return unfocusColor ?? Colors.greenAccent;
  }

  OutlineInputBorder get _errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      );

  OutlineInputBorder get _defaultBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      );

  Widget get _textField => TextFormField(
        focusNode: _focusNode,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        autovalidateMode: widget.autovalidateMode,
        obscureText: widget.obscureText,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        cursorColor: Colors.grey,
        onChanged: (v) {
          widget.onChanged?.call(v);
          String? errorMessage = widget.validator?.call(v);
          setState(() {
            _hasError = errorMessage != null;
          });
        },
        // validator: (v){
        //   String? errorMessage = widget.validator?.call(v);
        //     _hasError = !Util.falsyChecker(errorMessage);
        //     _text = v;
        //   return null;
        // },
        // style: TextStyles.subHeadlineBold.copyWith(
        //   color: PColors.shades.loEm,
        // ),
        decoration: InputDecoration(
          prefixIcon: widget.prefix,
          // prefixStyle: prefixStyle.copyWith(
          //   color: PColors.shades.loEm,
          // ),
          // prefixText: '+62',
          // suffixIconConstraints:
          //     const BoxConstraints(minHeight: 2, minWidth: 2),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 2, minWidth: 2),
          contentPadding: EdgeInsets.zero,
          fillColor: widget.enabled
              ? widget.fillColor ?? Colors.grey
              : Colors.transparent,
          hintText: widget.hintText,
          // hintStyle: _defaultStyle,
          filled: true,
          isDense: true,
          errorBorder: _errorBorder,
          // errorStyle: _errorStyle,
          // floatingLabelStyle: _hasError ? _errorStyle : _defaultStyle,
          // labelStyle: _defaultStyle,
          // focusedBorder: _hasError ? _errorBorder : _defaultBorder,
          border: _defaultBorder,
          // enabledBorder: _hasError ? _errorBorder : _defaultBorder,
          // focusedErrorBorder: _errorBorder,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
      alignment: Alignment.topCenter,
      curve: Curves.fastLinearToSlowEaseIn,
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: widget.margin,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: widget.enabled
                    ? widget.fillColor ?? Colors.grey
                    : Colors.grey,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _getFocusColor(),
                ),
              ),
              // height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.label,
                            ),
                            const SizedBox(width: 8),
                            Visibility(
                              visible: widget.isRequired,
                              child: const Text('*'),
                            ),
                            // Visibility(
                            //   visible: widget.isOptional,
                            //   child: Label.regular(
                            //     '(opsional)',
                            //     color: PColors.shades.loEm,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                          child: _textField,
                        ),
                      ],
                    ),
                  ),
                  if (widget.suffix != null) widget.suffix!,
                ],
              ),
            ),
            // Visibility(
            //   visible: _hasError,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16.0, top: 4),
            //     child: Label.regular(
            //       widget.validator?.call(_text) ?? CommonStrings.emptyString,
            //       color: PColors.alert.red700,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
