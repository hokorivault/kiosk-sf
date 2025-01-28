import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  final ValueChanged<String> onTextChanged;

  const CustomTextField({Key? key, required this.hintText, required this.controller, required this.onTextChanged}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    if(widget.hintText.contains('Qty')) {
      return Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: widget.controller,
            style: const TextStyle(
              fontSize: 22.0,
            ),
            decoration: InputDecoration(
              hintText: 'Input ${widget.hintText}',
            ),
          )
      );
    } else {
      return Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required input';
              }
            },
            style: const TextStyle(
              fontSize: 22.0,
            ),
            decoration: InputDecoration(
              hintText: 'Input ${widget.hintText}',
            ),
          )
      );
    }
  }
}