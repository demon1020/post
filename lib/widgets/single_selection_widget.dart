import 'package:flutter/material.dart';

class SingleSelectionWidget extends StatefulWidget {
  final List<String> options;

  SingleSelectionWidget({required this.options});

  @override
  _SingleSelectionWidgetState createState() => _SingleSelectionWidgetState();
}

class _SingleSelectionWidgetState extends State<SingleSelectionWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.options
          .map(
            (option) => RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
      )
          .toList(),
    );
  }
}