import 'package:flutter/material.dart';
import 'package:kiosk_sf/navbar.dart';

class EightyTen extends StatefulWidget {
  const EightyTen({Key? key}) : super(key: key);

  @override
  _EightyTenState createState() => _EightyTenState();
}

class _EightyTenState extends State<EightyTen> {

  final rcvDateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    rcvDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final List<Map> _lotWarehousing = [
      {
        'no': '1',
        'queue': '001',
        'expiryDate': '2021-10-06',
        'lot': 'B-1-01',
        'inspectQty': '12',
      },
      {
        'no': '2',
        'queue': '002',
        'expiryDate': '2021-10-07',
        'lot': 'B-12-03',
        'inspectQty': '12',
      },
    ];

    List<DataColumn> _createColumns() {
      return [
        const DataColumn(label: Text('No',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        ),
        const DataColumn(label: Text('입고순번',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        ),
        const DataColumn(label: Text('유통기한',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        ),
        const DataColumn(label: Text('LOT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        ),
        const DataColumn(label: Text('검수 수량',
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
        DataRow(cells: [
          DataCell(Text('#100')),
          DataCell(Text('Flutter Basics', style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text('David John')),
          DataCell(Text('David John')),
          DataCell(Text('David John'))
        ]),
        DataRow(cells: [
          DataCell(Text('#101')),
          DataCell(Text('Dart Internals')),
          DataCell(Text('Alex Wick')),
          DataCell(Text('David John')),
          DataCell(Text('David John')),
        ])
      ];
    }

    DataTable _createDataTable() {
      return DataTable(columns: _createColumns(), rows: _createRows());
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('8010 - 입고 검수 등록'),
          ),
          drawer: const NavBar(),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50, //height of button
                                child: ElevatedButton(
                                  child: const Text(
                                    '✖ 닫기',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black87, // red as border color
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 550.0,
                                    child: Column(
                                      children: <Widget>[
                                        //1st Row
                                        Row(
                                          children: <Widget>[
                                            const Text(
                                              '입고번호',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
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
                                            const Text(
                                              '입고일자',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            SizedBox(
                                              width: 135,
                                              child: TextField(
                                                controller: rcvDateController,
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
                                                  rcvDateController.text = startDate.toString().substring(0,10);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        // 2nd row
                                        Row(
                                          children: const <Widget>[
                                            Text('거래처',
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            SizedBox(
                                              width: 100.0,
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(left: 20.0),
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
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
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
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        //1st Row
                                        Row(
                                          children: const <Widget>[
                                            Text(
                                              '입고순번',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                enabled: false,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    fillColor: Colors.grey,
                                                    filled: true,
                                                    hintText: '001'
                                                ),
                                                style: TextStyle(
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Text(
                                              '입고유형',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
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
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Text(
                                              '진행상태',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
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
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        // 2nd row
                                        Row(
                                          children: const <Widget>[
                                            Text(
                                              '비  고',
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                EdgeInsets.only(left: 30.0),
                                                child: TextField(
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    fillColor: Colors.grey,
                                                    filled: true,
                                                    hintText: '입고 현장 작업용 업무',
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(Icons.star),
                            Text(
                              '입고지시품목 [2]',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: 50, //height of button
                              child: ElevatedButton(
                                child: const Text(
                                  'LOT 라벨 발행',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 80.0,
                            ),
                            SizedBox(
                              height: 50, //height of button
                              child: ElevatedButton(
                                child: const Text(
                                  '검수확정',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            SizedBox(
                              height: 50, //height of button
                              child: ElevatedButton(
                                child: const Text(
                                  '검수취소',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // DataTable(
                    //   columns: const <DataColumn>[
                    //     DataColumn(
                    //       label: Text(
                    //         'No',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Icon(Icons.indeterminate_check_box),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '입고순번',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '진행상태',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '품목코드',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '품목명',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '규격',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '단위',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '관리일수',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     DataColumn(
                    //       label: Text(
                    //         '발주수량',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 22.0,
                    //         ),
                    //       ),
                    //     ),
                    //     // DataColumn(
                    //     //   label: Text(
                    //     //     '입고수량',
                    //     //     style: TextStyle(
                    //     //       fontWeight: FontWeight.bold,
                    //     //       fontSize: 22.0,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // DataColumn(
                    //     //   label: Text(
                    //     //     '검수수량',
                    //     //     style: TextStyle(
                    //     //       fontWeight: FontWeight.bold,
                    //     //       fontSize: 22.0,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // DataColumn(
                    //     //   label: Text(
                    //     //     '입고위치',
                    //     //     style: TextStyle(
                    //     //       fontWeight: FontWeight.bold,
                    //     //       fontSize: 22.0,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    //   rows: const <DataRow>[
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(
                    //           Text('1',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(Icon(Icons.check_box)),
                    //         DataCell(
                    //           Text('1',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('21000033',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('두릅',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('100g x 50ea',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('kg',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('유통기한',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('365',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('0',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         // DataCell(
                    //         //   Text('19',
                    //         //     style: TextStyle(
                    //         //       fontSize: 22.0,
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //         // DataCell(
                    //         //   Text('4',
                    //         //     style: TextStyle(
                    //         //       fontSize: 22.0,
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //         // DataCell(
                    //         //   Text('B-1-03',
                    //         //     style: TextStyle(
                    //         //       fontSize: 22.0,
                    //         //     ),
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //     DataRow(
                    //       cells: <DataCell>[
                    //         DataCell(
                    //           Text('2',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(Icon(Icons.check_box_outline_blank)),
                    //         DataCell(
                    //           Text('1',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('21000001',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('질경이',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('100g x 50ea',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('kg',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('유통기한',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('360',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //         DataCell(
                    //           Text('0',
                    //             style: TextStyle(
                    //               fontSize: 22.0,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: <DataColumn> [
                            DataColumn(
                                label: Text('No.')
                            ),
                            DataColumn(
                              label: Checkbox(value: false, onChanged: (bool? value){value = value;}),
                            ),
                            DataColumn(
                              label: Text('Item Queue'),
                            ),
                            DataColumn(
                              label: Text('Receiving Status'),
                            ),
                            DataColumn(
                              label: Text('Item Code'),
                            ),
                            DataColumn(
                              label: Text('Item Name'),
                            ),
                            DataColumn(
                              label: Text('Item Unit'),
                            ),
                            DataColumn(
                              label: Text('Item Management Unit'),
                            ),
                            DataColumn(
                              label: Text('Expiration Type'),
                            ),
                            DataColumn(
                              label: Text('Shelf Life'),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Checkbox(value: false, onChanged: (bool? value){value = value;})),
                                DataCell(Text('001')),
                                DataCell(Text('Receiving Registration')),
                                DataCell(Text('51000001')),
                                DataCell(Text('Knightmare Frame Shinkirou')),
                                DataCell(Text('1')),
                                DataCell(Text('Unit')),
                                DataCell(Text('Not Managed')),
                                DataCell(Text('5 Yrs.')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                                DataCell(Text('')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                // 입고 LOT Bottom Grid
                Row(
                  children: [
                    SizedBox(
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'No',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '입고순번',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '유통기한',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'LOT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              '검수 수량',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('1',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('001',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('2021-10-06',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('B-1-01',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('10',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Text('2',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('002',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('2021-11-10',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('F-2-72',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text('10',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width: 10.0
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '5',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '6',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '7',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '8',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '9',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'A',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'B',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'C',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'D',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'E',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'F',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'G',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'H',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'I',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'J',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'K',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'L',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'M',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'N',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'O',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'P',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Q',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'R',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'S',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'T',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'U',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'V',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'W',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'X',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Y',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Z',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 50, //height of button
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '<',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'CLS',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 5.0
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}