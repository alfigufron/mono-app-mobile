import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mono_app/common/constants/constant.dart';

class DatePickerTextField extends StatefulWidget {
  final String? label;
  final String? icon;
  final String? hint;
  final bool? obscureText;
  final Function(DateTime)? onDateSelected;
  const DatePickerTextField(
      {super.key,
      this.label,
      this.icon,
      this.hint,
      this.obscureText,
      this.onDateSelected});

  @override
  DatePickerTextFieldState createState() => DatePickerTextFieldState();
}

class DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('DD-MM-yyyy').format(picked).toString();
      });

      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  final TextStyle labelTextStyle = const TextStyle(
      color: Color(0XFF666666), fontSize: 14, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.label != null)
        Text(
          widget.label!,
          style: labelTextStyle,
        ),
      if (widget.label != null) const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color(0XFFDDDDDD), width: 1),
        ),
        child: TextFormField(
          controller: _dateController,
          readOnly: true,
          // onChanged: widget.onChanged,
          obscureText: widget.obscureText ?? false,
          onTap: () {
            _selectDate(context);
          },
          cursorColor: const Color(0XFF429690),
          decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Image.asset(LocalIcons.calender),
              ),
              hintText: widget.hint,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              prefixIcon: widget.icon != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                      child: SvgPicture.asset(
                        widget.icon!,
                        width: 24,
                        height: 24,
                      ),
                    )
                  : null,
              border: InputBorder.none),
        ),
      )
    ]);
  }
}
