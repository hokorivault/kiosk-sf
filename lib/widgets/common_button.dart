import 'package:flutter/material.dart';
import 'package:kiosk_sf/variables/button_type.dart';

class CommonButton extends StatefulWidget {
  final String title;
  final ButtonType buttonType;
  final void Function()? onPressed;

  const CommonButton({
    Key? key,
    required this.title,
    required this.buttonType,
    required this.onPressed,
  }) : super(key: key);

  static Color buttonColor(ButtonType type) {
    switch (type) {
      case ButtonType.normal:
        return Colors.blue;

      case ButtonType.delete:
        return Colors.red;

      case ButtonType.someOtherType:
        return Colors.yellow;

      case ButtonType.someOtherOtherType:
        return Colors.green;
    }
  }

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(widget.title),
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.all(CommonButton.buttonColor(widget.buttonType)),
      ),
      onPressed: widget.onPressed,
    );
  }
}
