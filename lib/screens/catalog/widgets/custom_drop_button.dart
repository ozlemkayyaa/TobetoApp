import 'package:flutter/material.dart';
import 'package:tobeto/screens/catalog/models/dropdown_items.dart';

class CustomDropdownButton extends StatefulWidget {
  final String buttonText;
  final List<DropdownItem> itemList;

  const CustomDropdownButton(
      {required this.buttonText, required this.itemList, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  DropdownItem? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButton<DropdownItem>(
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(
            height: 0,
          ),
          hint: Text(widget.buttonText),
          value: _selectedItem,
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          },
          items: widget.itemList.map((item) {
            return DropdownMenuItem<DropdownItem>(
              value: item,
              child: Text(item.text),
            );
          }).toList(),
        ),
      ),
    );
  }
}
