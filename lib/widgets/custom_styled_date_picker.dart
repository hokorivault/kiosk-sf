import 'package:flutter/material.dart';

class CustomStyledDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  final ValueChanged<String> onDateTimeChanged;

  const CustomStyledDatePicker({Key? key, required this.controller, required this.labelText, required this.onDateTimeChanged }) : super(key: key);

  @override
  _CustomStyledDatePickerState createState() => _CustomStyledDatePickerState();
}

class _CustomStyledDatePickerState extends State<CustomStyledDatePicker> {


  static String dateStr = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // decoration: BoxDecoration(
        //     color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.labelText + ':',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextFormField(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.today),
                ),
                showCursor: true,
                readOnly: true,
                controller: widget.controller,
                validator: (val) => val!.isEmpty ? 'Date is required' : null,
                onTap: () async {
                  var selectedDate =  await showDatePicker(
                      context: context,
                      initialDate:DateTime.now(),
                      firstDate:DateTime(1900),
                      lastDate: DateTime(2100));
                  widget.controller.text = selectedDate.toString().substring(0,10);
                  dateStr = widget.controller.text;
                  print('dateStr: $dateStr');
                  widget.onDateTimeChanged(dateStr);
                },
                // onChanged: (dt) {
                //   dateT = widget.controller.text;
                //   print('dateT: $dateT');
                //   widget.onDateTimeChanged(dateT);
                // },
            ),
          ],
        )
    );
  }
}
