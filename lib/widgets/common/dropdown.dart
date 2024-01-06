import 'package:flutter/material.dart';

class MyDropdownTextField extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemSelected;
  final String initialValue; 

  const MyDropdownTextField({
    Key? key,
    required this.items,
    required this.onItemSelected,
    required this.initialValue, 
  }) : super(key: key);

  @override
  MyDropdownTextFieldState createState() => MyDropdownTextFieldState();
}

class MyDropdownTextFieldState extends State<MyDropdownTextField> {
  String? _selectedValue;

  final TextStyle labelTextStyle = const TextStyle(
    color: Color(0XFF666666),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type',
          style: labelTextStyle,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: const Color(0XFFDDDDDD), width: 1),
          ),
          child: TextFormField(
            controller: TextEditingController(text: _selectedValue),
            readOnly: true,
            onTap: () {
              _showDropdown(context);
            },
            cursorColor: const Color(0XFF429690),
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  _showDropdown(context);
                },
                child: const Icon(Icons.arrow_drop_down),
              ),
              hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  void _showDropdown(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox textField = context.findRenderObject() as RenderBox;

    final Offset overlayPosition =
        textField.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      color: Colors.white,
      position: RelativeRect.fromLTRB(
        overlayPosition.dx,
        overlayPosition.dy + textField.size.height,
        overlayPosition.dx + textField.size.width,
        overlayPosition.dy + textField.size.height + widget.items.length * 50.0,
      ),
      constraints: BoxConstraints(maxWidth: textField.size.width),
      items: widget.items.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedValue = value;
        });
        if (widget.onItemSelected != null) {
          widget.onItemSelected(value);
        }
      }
    });
  }
}
