part of '../widget.dart';

class AppInputText extends StatelessWidget {
  final String? label;
  final String? icon;
  final String? hint;
  final bool obscureText;

  const AppInputText(
      {Key? key, this.label, this.icon, this.hint, this.obscureText = false})
      : super(key: key);

  final TextStyle labelTextStyle = const TextStyle(
      color: Color(0XFF666666), fontSize: 14, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (label != null)
        Text(
          label!,
          style: labelTextStyle,
        ),
      if (label != null) const SizedBox(height: 18),
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color(0XFFDDDDDD), width: 1),
        ),
        child: TextFormField(
          cursorColor: Color(0XFF429690),
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              prefixIcon: icon != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                      child: SvgPicture.asset(
                        icon!,
                        width: 24,
                        height: 24,
                        color: const Color(0XFF666666),
                      ),
                    )
                  : null,
              border: InputBorder.none),
        ),
      )
    ]);
  }
}
