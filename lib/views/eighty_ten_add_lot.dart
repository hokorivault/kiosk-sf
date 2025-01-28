import 'package:flutter/material.dart';
import 'package:kiosk_sf/services/data_service.dart';

// cubits
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/cubits/rst/rst_response_cubit.dart';
import 'package:kiosk_sf/cubits/rst/rst_response_states.dart';
import 'package:kiosk_sf/widgets/custom_progress_indicator.dart';

// custom widgets
import 'package:kiosk_sf/widgets/custom_styled_date_picker.dart';
import 'package:kiosk_sf/widgets/custom_textfield.dart';

// functions
import 'package:kiosk_sf/functions/get_current_date.dart';


class EightyTenAddLot extends StatefulWidget {

  final List<dynamic> addLotData;

  const EightyTenAddLot({Key? key, required this.addLotData}) : super(key: key);

  @override
  _EightyTenAddLotState createState() => _EightyTenAddLotState();
}

class _EightyTenAddLotState extends State<EightyTenAddLot> {

  String dateNowString = DateTime.now().toString();
  String selectedDate = '';
  String alphaNumericText = '';

  var addLotMap = {};
  var addLotList = [];

  final dateController = TextEditingController();
  final mngDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final alphaNumericController = TextEditingController();
  final lotController = TextEditingController();
  final inspQtyController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    mngDateController.dispose();
    expiryDateController.dispose();
    alphaNumericController.dispose();
    lotController.dispose();
    inspQtyController.dispose();
    super.dispose();
  }

  final _dataService = DataService();

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    String currentDateStr = currentDate.toString();
    currentDateStr = currentDateStr.substring(0,10);
    //currentDateStr = currentDateStr.replaceAll('-', '');
    return currentDateStr;
  }

  void initializeDates() {
    //dateController.text = _getCurrentDate();
    mngDateController.text = _getCurrentDate();
    expiryDateController.text = _getCurrentDate();
    addLotMap['mng_date'] = _getCurrentDate();
    addLotMap['expiry_date'] = _getCurrentDate();
  }

  Widget _createLabelInput(String labelText){
    if(labelText.contains('Date')) {
      initializeDates();

      if(labelText == 'Managed Date'){
        return CustomStyledDatePicker(labelText: labelText, controller: mngDateController, onDateTimeChanged: (newDate) {
          selectedDate = newDate;
          print('selectedDate: $selectedDate');
          addLotMap['mng_date'] = selectedDate;
          mngDateController.text = selectedDate;
        },);
      } else {
        return CustomStyledDatePicker(labelText: labelText, controller: expiryDateController, onDateTimeChanged: (newDate) {
          selectedDate = newDate;
          print('selectedDate: $selectedDate');
          addLotMap['expiry_date'] = selectedDate;
          expiryDateController.text = selectedDate;
        },);
      }

    } else {
      if(labelText == 'LOT'){
        return Column(
          children: [
            CustomTextField(hintText: labelText, controller: lotController, onTextChanged: (newAlphaNumericText) {
              alphaNumericText = newAlphaNumericText;
              print('alphaNumericText: $alphaNumericText');
              addLotMap['lot'] = alphaNumericText;
              lotController.text = alphaNumericText;
            },),
          ],
        );
      } else {
        return Column(
          children: [
            CustomTextField(hintText: labelText, controller: inspQtyController, onTextChanged: (newAlphaNumericText) {
              alphaNumericText = newAlphaNumericText;
              addLotMap['insp_qty'] = alphaNumericText;
              print('alphaNumericText: $alphaNumericText');
            },),
          ],
        );
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('8010 - Add Lot'),
          leading: IconButton(icon: const Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
      ),
      body: BlocProvider<RstResponseCubit>(
        create: (context) => RstResponseCubit(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    //main content
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10, color: Colors.grey.shade300, spreadRadius: 5)
                          ]),
                      child: BlocBuilder<RstResponseCubit, RstResponseStates>(
                        builder: (context, state) {
                          if(state is rstLoadingState) {
                            return const CustomProgressIndicator();
                          } else if(state is rstReadyState) {
                            return Column(
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
                                  //CommonButton(title: 'Submit', buttonType: buttonType, onPressed: (){}),
                                  // Submit button
                                  SizedBox(
                                    height: 50,
                                    child: Builder(
                                        builder: (context) {
                                          return ElevatedButton(
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              print('addLotData[0]: ${widget.addLotData[0]}');
                                              String rcvDt = widget.addLotData[0]["rcv_dt"];
                                              rcvDt = rcvDt.replaceAll('-', '');
                                              int dtlSeq = widget.addLotData[0]["dtl_seq"];
                                              String itemCd = widget.addLotData[0]["item_cd"];

                                              //_saveRcvwork8010F_40W( mngDateController.text, expiryDateController.text, lotController.text, inspQtyController.text, rcvDt, dtlSeq, itemCd);

                                              String currentDateStr = GetCurrentDate.noHypen();
                                              String mngDateStr;

                                              if(mngDateController.text == null || mngDateController.text == '') {
                                                mngDateStr = currentDateStr;
                                                print(mngDateStr);
                                              } else {
                                                mngDateStr = mngDateController.text;
                                                mngDateStr = mngDateStr.replaceAll('-', '');
                                              }

                                              String expiryDateStr;
                                              if(expiryDateController.text == null || expiryDateController.text == '') {
                                                expiryDateStr = currentDateStr;
                                                print(expiryDateStr);
                                              } else {
                                                expiryDateStr = expiryDateController.text;
                                                expiryDateStr = expiryDateStr.replaceAll('-', '');
                                              }

                                              String lot = lotController.text;
                                              String inspectedQty = inspQtyController.text;
                                              //print('rcvDt: $rcvDt\ndtlSeq: $dtlSeq\nitemCd: $itemCd');
                                              //print('mngDateStr: $mngDateStr\nexpiryDateStr: $expiryDateStr\nlot: $lot\ninspectedQty: $inspectedQty');

                                              BlocProvider.of<RstResponseCubit>(context).addLotRcvwork8010F_40W(mngDateStr, expiryDateStr, lot, inspectedQty, rcvDt, dtlSeq, itemCd );
                                            },
                                          );
                                        }
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  )
                                ]
                            );
                          } else if (state is rstSaveSuccessState) {
                            return Text('Add Lot successfully saved.');
                          } else {
                            return const Text('No Rows to show');
                          }
                        }
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}

