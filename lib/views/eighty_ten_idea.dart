import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiosk_sf/route/route.dart' as route;
import 'package:kiosk_sf/services/data_service.dart';

// cubits
import 'package:kiosk_sf/cubits/8010/receiving_lists_cubit.dart';
import 'package:kiosk_sf/cubits/8010/receiving_lists_states.dart';

// widgets
import 'package:kiosk_sf/widgets/custom_date_picker.dart';
import 'package:kiosk_sf/widgets/custom_progress_indicator.dart';

//functions
import 'package:kiosk_sf/functions/get_current_date.dart';

// variables
import 'package:kiosk_sf/variables/8010/eighty_ten_columns.dart';

class EightyTenIdea extends StatefulWidget {

  const EightyTenIdea({Key? key, Object? arguments}) : super(key: key);

  @override
  _EightyTenIdeaState createState() => _EightyTenIdeaState();
}

class _EightyTenIdeaState extends State<EightyTenIdea> {

  String accountName = 'jpim';
  String accountEmail = 'jpim@test.com';

  String dateNowString = DateTime.now().toString();
  String selectedDate = '';

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final acctNoController = TextEditingController();

  double commonWidthSize = 15.0;

  bool _isSearchFormVisible = false;
  bool _isDataTableVisible = false;

  String dropdownValue = 'All';
  var rcvTypeKr = ['All','1', '2', '9'];
  String rcvTypeNm = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    startDateController.dispose();
    endDateController.dispose();
    acctNoController.dispose();
    super.dispose();
  }

  void toggleRcvListTable() {
    setState(() {
      _isSearchFormVisible = !_isSearchFormVisible;
    });
  }

  void toggleDataTable() {
    setState(() {
      _isDataTableVisible = !_isDataTableVisible;
    });
  }

  int selectedIndex = -1;

  void handleSelectedIndex(int val, String recvNo) {
    print('val: $val\nrecvNo: $recvNo');
    Navigator.pushNamed(context, route.eightyTenTabletPg2, arguments: recvNo);
  }

  List<DataRow> _rowsFromApi(receivingList) {
    //print(receivingList);
    List<DataRow> rcvRows = [];
    int noCounter = 0;

    if(receivingList.length > 0) {
      for(int x=0; x < receivingList.length; x++ ) {

        rcvRows.add(
            DataRow(
                onSelectChanged: (val) {
                  // noCounter = x + 1;
                  // handleSelectedIndex( noCounter, receivingList[x].rcv_no);
                  Navigator.pushNamed(context, route.eightyTenTabletPg2, arguments: receivingList[x].rcv_no);
                },
                cells: [
                  DataCell(
                      Text('${x+1}')
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_dt)
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_seq.toString())
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_no)
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_status_nm)
                  ),
                  DataCell(
                      Text(receivingList[x].cust_cd)
                  ),
                  DataCell(
                      Text(receivingList[x].cust_nm)
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_type_nm)
                  ),
                  DataCell(
                      Text(receivingList[x].item_cnt.toString())
                  ),
                ]
            )
        );
      }

    } else {
      rcvRows.add(
          const DataRow(
              cells: <DataCell>[
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('No rows to show.')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]
          )
      );
    }
    return rcvRows;
  }

  List<DataColumn> getColumns(List<String> columns) => columns.map((String column) => DataColumn(
    label: Text(column,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 10.0,
      ),
    ),
  )).toList();

  DataTable _createRcvListDataTable(state) {
    return DataTable(
      showCheckboxColumn: false,
      columns: getColumns(EightyTenColumns().columns_11P_10Q),
      rows: _rowsFromApi(state.rcvLists),
      dividerThickness: 2,
      dataRowHeight: 50,
      showBottomBorder: true,
      headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      headingRowColor: MaterialStateProperty.resolveWith(
              (states) => const Color(0xFF3F51B5)
      ),
      // dataRowColor: MaterialStateColor.resolveWith(
      //         (states) => const Color(0xFFC5CAE9)
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F51B5),
          width: 3,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  // PaginatedDataTable _createRcvListPDataTable (receivingList) {
  //
  //   return PaginatedDataTable(
  //       source: _rowsFromApi(receivingList),
  //       header: Text('RecevingList'),
  //       columns: _createColumns(),
  //       columnSpacing: 20,
  //       horizontalMargin: 10,
  //       rowsPerPage: 8,
  //       showCheckboxColumn: false,
  //     );
  // }

  Widget _rcvListContent(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
                Icons.star,
                color: Colors.red
            ),
            Text(
              'Receiving List [ ${state.rcvLists.length} ]',
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
          ],
        ),
        const SizedBox(
            height: 10.0
        ),
        _createRcvListDataTable(state),
      ],
    );
  }

  Widget _rcvListCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Receiving List',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
                height: 10.0
            ),
          ],
        ),
      ),
    );
  }

  void initializeDates() {
    startDateController.text = GetCurrentDate.wHypen();
    endDateController.text = GetCurrentDate.wHypen();
  }

  Widget _initCreateDatePicker(String kind) {
    if(kind == 'start') {
      initializeDates();
      return CustomDatePicker(controller: startDateController, onDateTimeChanged: (newDate) {
        selectedDate = newDate;
        print('selectedDate: $selectedDate');
        startDateController.text = selectedDate;
      });
    } else {
      initializeDates();
      return CustomDatePicker(controller: endDateController, onDateTimeChanged: (newDate) {
        selectedDate = newDate;
        print('selectedDate: $selectedDate');
        endDateController.text = selectedDate;
      });
    }
  }

  Widget _searchCriteriaCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Text(
              '입고일자',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              width: commonWidthSize,
            ),
            // Date picker Start date
            _initCreateDatePicker('start'),
            SizedBox(
              width: commonWidthSize,
            ),
            // Date picker End date
            _initCreateDatePicker('end'),
            SizedBox(
              width: commonWidthSize,
            ),
            const Text(
              'Receiving\nType',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              width: commonWidthSize,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 20.0,
              ),
              underline: Container(
                height: 2,
                color: Colors.indigo,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  rcvTypeNm = dropdownValue;
                  print('dropdownValue: $dropdownValue');
                });
              },
              items:
              rcvTypeKr.map((String types) {
                return DropdownMenuItem(
                  value: types,
                  child: Text(types),
                );
              }).toList(),
            ),
            SizedBox(
              width: commonWidthSize,
            ),
            SizedBox(
              width: 125.0,
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 15.0,
                ),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // prefixIcon: Icon(Icons.search),
                    hintText: 'Account code'
                ),
                controller: acctNoController,
              ),
            ),
            SizedBox(
              width: 0.5,
            ),
            // Magnifier button
            SizedBox(
              width: 49.0,
              child: TextButton.icon(
                icon: Icon(Icons.search),
                label: Text(''),
                onPressed: (){},
              ),
            ),
            SizedBox(
              width: 0.5,
            ),
            SizedBox(
              width: 125.0,
              child: TextFormField(
                enabled: false,
                style: const TextStyle(
                  fontSize: 15.0,
                ),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Account name'
                ),
              ),
            ),
            SizedBox(
              width: commonWidthSize,
            ),
            // Search Button
            SizedBox(
              height: 50, //height of button
              child: Builder(
                builder: (context) {
                  return ElevatedButton.icon(
                    label: const Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      String currentDateStr = GetCurrentDate.noHypen();
                      String startDateStr;
                      startDateStr = startDateController.text;
                      startDateStr = _dateNoHypen(startDateStr);

                      if(endDateController.text.isEmpty) {

                      }

                      String endDateStr;
                      endDateStr = endDateController.text;
                      endDateStr = _dateNoHypen(endDateStr);

                      //print('startDateStr: $startDateStr');
                      //print('endDateController: $endDateStr');

                      BlocProvider.of<ReceivingListsCubit>(context).getRcvWork8011P_10Q(startDateStr, endDateStr, rcvTypeNm, acctNoController.text );
                    }
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _dataService = DataService();

  String _dateNoHypen(dateParam) {
    if(dateParam.isNotEmpty) {
      dateParam = dateParam.replaceAll('-', '');
    } else {
      dateParam = GetCurrentDate.noHypen();
      print(dateParam);
    }
    return dateParam;
  }

  // main Widget
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              title: const Text('8010 - Receipt Inspection Registration'),
              leading: IconButton(icon: const Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: BlocProvider<ReceivingListsCubit>(
            create: (context) => ReceivingListsCubit(),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: _searchCriteriaCard(),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: BlocBuilder<ReceivingListsCubit, ReceivingListsStates>(
                                  builder: (context, state) {
                                    if(state is rlLoadingState) {
                                      return const CustomProgressIndicator();
                                    } else if(state is rlLoadedState) {
                                      return _rcvListContent(state);
                                    } else {
                                      return Text('No Rows to show');
                                    }
                                  }
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
