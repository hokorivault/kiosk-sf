import 'package:flutter/material.dart';
import 'package:kiosk_sf/route/route.dart' as route;
import 'package:kiosk_sf/navbar.dart';


class EightyTenTablet extends StatefulWidget {
  const EightyTenTablet({Key? key}) : super(key: key);

  @override
  _EightyTenTabletState createState() => _EightyTenTabletState();
}

class _EightyTenTabletState extends State<EightyTenTablet> {

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  String accountName = 'jpim';
  String accountEmail = 'jpim@test.com';

  bool _isSearchFormVisible = false;
  bool _isDataTableVisible = false;

  String dropdownValue = 'All';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  void toggleSearchForm() {
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

  void handleSelectedIndex(int val) {
    setState(() {
      selectedIndex = val;
      print('selectedIndex is $val');
      Navigator.pushNamed(context, route.eightyTenTabletPg2Kr);
    });
    // Useful for navigating to different data
    // if(val == 0) {
    //   Navigator.pushNamed(context, route.eightyTenTabletPg2)
    // }
  }

  void getSelectedRowInfo() {
    print('Selected Item Row Name Here...');
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text(
          'No',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '입고일자',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '입고순번',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '진행상태',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '거래처',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '거래처명',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '입고유형',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '품목수',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(
          selected: 0 == selectedIndex,
          onSelectChanged: (val) {
            handleSelectedIndex(0);
          },
          cells: [
            DataCell(
              Text('1',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('2021-10-11',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('1',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('입고등록',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('40032',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('Albedo’s Alchemy',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('매입입고',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('1',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ]
      ),
      DataRow(
          selected: 1 == selectedIndex,
          onSelectChanged: (val) {
            handleSelectedIndex(1);
          },
          cells: [
            DataCell(
              Text('2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('2021-09-09',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('입고등록',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('40030',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              const Text('Xiangling',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('매입입고',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ]
      ),
    ];
  }

  DataTable _createDataTable() {
    return DataTable(
      showCheckboxColumn: false,
      columns: _createColumns(),
      rows: _createRows(),
      dividerThickness: 5,
      dataRowHeight: 80,
      showBottomBorder: true,
      headingTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      headingRowColor: MaterialStateProperty.resolveWith(
              (states) => const Color(0xFF3F51B5)
      ),
      dataRowColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFC5CAE9)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            automaticallyImplyLeading: true,
            title: const Text('8010 - 입고 검수 등록'),
            leading: IconButton(icon: const Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            )
          ),
          body: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Search Form
                  SizedBox(
                    width: 600.0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            const Text(
                              '입고번호',
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            const Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            SizedBox(
                              height: 50, //height of button
                              child: ElevatedButton(
                                onPressed: toggleSearchForm,
                                child: const Text(
                                  '입고번호 검색',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isSearchFormVisible,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 1200.0,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: <Widget> [
                                      const Text(
                                        '입고일자',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      // Date picker Start date
                                      SizedBox(
                                        width: 135,
                                        child: TextField(
                                          controller: startDateController,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),

                                          ),
                                          onTap: () async {
                                            var startDate =  await showDatePicker(
                                                context: context,
                                                initialDate:DateTime.now(),
                                                firstDate:DateTime(1900),
                                                lastDate: DateTime(2100));
                                            startDateController.text = startDate.toString().substring(0,10);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      // Date picker End date
                                      SizedBox(
                                        width: 135,
                                        child: TextField(
                                          controller: endDateController,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),

                                          ),
                                          onTap: () async {
                                            var endDate =  await showDatePicker(
                                                context: context,
                                                initialDate:DateTime.now(),
                                                firstDate:DateTime(1900),
                                                lastDate: DateTime(2100));
                                            endDateController.text = endDate.toString().substring(0,10);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const Text(
                                        '입고유형',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DropdownButton<String>(
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
                                              });
                                            },
                                            items: <String>['All','매입입고', '사급입고', '기타입고']
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      // Customer
                                      const Text(
                                        '거래처',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const SizedBox(
                                        width: 100.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Ink(
                                        decoration: const ShapeDecoration(
                                          color: Colors.lightBlue,
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                            icon: const Icon(Icons.find_in_page),
                                            color: Colors.white,
                                            onPressed: () {}
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      const SizedBox(
                                        width: 150.0,
                                        child: TextField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.grey,
                                            filled: true,
                                          ),
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      SizedBox(
                                        height: 50, //height of button
                                        child: ElevatedButton(
                                          onPressed: toggleDataTable,
                                          child: const Text(
                                            '검색',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Visibility(
                          visible: _isDataTableVisible,
                          child: Center(
                            child: _createDataTable()
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Datatable

                ],
              ),
            ),
          ),
        )
    );
  }
}