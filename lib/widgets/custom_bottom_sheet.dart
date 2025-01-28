import 'package:flutter/material.dart';
import 'package:kiosk_sf/services/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kiosk_sf/widgets/custom_textfield.dart';

class CustomBottomSheetWidget extends StatefulWidget {
  final String hintText;
  const CustomBottomSheetWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  _CustomBottomSheetWidgetState createState() => _CustomBottomSheetWidgetState();
}

class _CustomBottomSheetWidgetState extends State<CustomBottomSheetWidget> {

  String dateNowString = DateTime.now().toString();
  final dateController = TextEditingController();
  final mngDateController = TextEditingController();
  final lotController = TextEditingController();
  final expiryDateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    mngDateController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  final _dataService = DataService();

  String _getCurrentDate() {
    DateTime now = new DateTime.now();
    DateTime currentDate = new DateTime(now.year, now.month, now.day);
    String currentDateStr = currentDate.toString();
    currentDateStr = currentDateStr.substring(0,10);
    //currentDateStr = currentDateStr.replaceAll('-', '');
    return currentDateStr;
  }



  void _eightyTen_40W() async {
    SharedPreferences jsessionId = await SharedPreferences.getInstance();
    String? extractJsessionId = jsessionId.getString('jsessionid');

    String currentDateStr = _getCurrentDate();

    String mngDateStr = mngDateController.text;
    if(mngDateStr.isNotEmpty) {
      mngDateStr = mngDateStr.replaceAll('-', '');
    } else {
      mngDateStr = currentDateStr;
      print(mngDateStr);
    }

    String expiryDateStr = expiryDateController.text;
    if(expiryDateStr.isNotEmpty) {
      expiryDateStr = expiryDateStr.replaceAll('-', '');
    } else {
      expiryDateStr = currentDateStr;
      print(expiryDateStr);
    }

    //final response = await _dataService.eighty10_40W(extractJsessionId, mngDateStr, expiryDateStr );
    // if (response != null) {
    //   print('response is not null');
    //   print(response.toString());
    // } else {
    //   print('response is NOT 1');
    // }
  }

  Widget _createLabelInput(String labelText){
    if(labelText.contains('Date')) {
      dateController.text = _getCurrentDate();
      return Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // decoration: BoxDecoration(
          //     color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
              decoration: InputDecoration(
                hintText: labelText,
                prefixIcon: Icon(Icons.today),
              ),
              showCursor: true,
              readOnly: true,
              controller: dateController,
              onTap: () async {
                var selectedDate =  await showDatePicker(
                    context: context,
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));
                dateController.text = selectedDate.toString().substring(0,10);
              }
          )
      );
    } else {
      return Column(
        children: [
          CustomTextField(hintText: labelText, onTextChanged: (newTextValue){ }, controller: lotController,),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF3F51B5),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Add Lot",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.grey.shade300, spreadRadius: 5)
                  ]),
              child: Column(
                  children: [
                    const SizedBox(
                      height: 2.0,
                    ),
                    _createLabelInput('Managed Date'),
                    const SizedBox(
                      height: 2.0,
                    ),
                    _createLabelInput('Expiration Date'),
                    const SizedBox(
                      height: 2.0,
                    ),
                    _createLabelInput('LOT'),
                    const SizedBox(
                      height: 2.0,
                    ),
                    _createLabelInput('Inspected Qty.'),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _eightyTen_40W();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    )
                  ]
              ),
            ),
          ]
      ),
    );
  }
}

