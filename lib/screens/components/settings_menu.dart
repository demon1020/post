import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  SettingsMenu({
    Key? key,
    required this.text,
    required this.press,
    this.label = "",
    this.iconData = Icons.edit,
  }) : super(key: key);

  final String text, label;
  final IconData iconData;
  final Function(String value) press;

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  bool isEditEnabled = false;
  TextEditingController controller = TextEditingController();

  toggle() {
    isEditEnabled = !isEditEnabled;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: null,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: !isEditEnabled,
                    controller: controller,
                    onChanged: (value) {
                      controller.text = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      label: Text(widget.label),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: toggle,
                        icon: isEditEnabled
                            ? Icon(Icons.close)
                            : Icon(widget.iconData),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isEditEnabled,
              child: ElevatedButton(
                onPressed: () {
                  widget.press(controller.text);
                },
                child: Text('Update ${widget.label}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
