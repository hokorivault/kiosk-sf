import 'package:flutter/material.dart';
import 'package:kiosk_sf/services/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom_textfield.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  String dateNowString = DateTime.now().toString();
  final mngDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final lotController = TextEditingController();

  final _dataService = DataService();

  String _getCurrentDate() {
    DateTime now = new DateTime.now();
    DateTime currentDate = new DateTime(now.year, now.month, now.day);
    String currentDateStr = currentDate.toString();
    currentDateStr = currentDateStr.substring(0,10);
    currentDateStr = currentDateStr.replaceAll('-', '');
    return currentDateStr;
  }

  Widget _createLabelInput(String labelText){
    return Column(
      children: [
        CustomTextField(hintText: labelText, onTextChanged: (String value) {  }, controller: lotController,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 8),
      height: MediaQuery.of(context).size.height * 0.65,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
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
      ),
    );
  }
}
