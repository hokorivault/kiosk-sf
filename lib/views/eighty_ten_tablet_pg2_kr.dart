import 'package:flutter/material.dart';


class EightyTenTabletPg2Kr extends StatefulWidget {
  const EightyTenTabletPg2Kr({Key? key}) : super(key: key);

  @override
  _EightyTenTabletPg2KrState createState() => _EightyTenTabletPg2KrState();
}

class _EightyTenTabletPg2KrState extends State<EightyTenTabletPg2Kr> {

  String accountName = 'jpim';
  String accountEmail = 'jpim@test.com';

  int selectedIndex = -1;

  void handleSelectedIndex(int val) {
    setState(() {
      selectedIndex = val;
      print('selectedIndex is $val');
    });
    // Useful for navigating to different data
    // if(val == 0) {
    //   Navigator.pushNamed(context, route.eightyTenTabletPg2)
    // }
  }

  List<DataColumn> _createColumns() {
    return [
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
      const DataRow(
          cells: [
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
              Text('Xiangling',
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
    ];
  }

  DataTable _createRcvDataTable() {
    return DataTable(
      // showCheckboxColumn: false,
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


  List<DataColumn> _createItemsDetailColumns() {
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
      DataColumn(
        label: Checkbox(
          value: false, onChanged: (bool? value){value = value;},
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
          '품목코드',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '품목명',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '규격',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '단위',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '관리구분',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '관리일수',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '발주수량',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '입고수량',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '검수수량',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '입고위치',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createItemsDetailRows() {
    return [
      const DataRow(
          cells: [
            DataCell(
              Text('1',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
                Icon(Icons.check_box_outline_blank),
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
              Text('21000033',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('두릅',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('100g x 50ea',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('kg',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('유통기한',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('365',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('0',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('19',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('4',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('B-1-03',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ]
      ),
      const DataRow(
          cells: [
            DataCell(
              Text('2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Icon(Icons.check_box_outline_blank),
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
              Text('21000001',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('질경이',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('100g x 50ea',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('kg',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('유통기한',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('360',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('0',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('11',
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
              Text('B-1-01',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ]
      ),
    ];
  }

  DataTable _createItemsDetailDataTable() {
    return DataTable(
      columns: _createItemsDetailColumns(),
      rows: _createItemsDetailRows(),
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

  List<DataColumn> _createLotWarehousingColumns() {
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
          '입고순번',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '유통기한',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'LOT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          '검수 수량',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createLotWarehousingRows() {
    return [
      const DataRow(
          cells: [
            DataCell(
              Text('1',
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
              Text('2021-12-31',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('tzx2y2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('3',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          ]
      ),
      const DataRow(
          cells: [
            DataCell(
              Text('2',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('3',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('2021-12-31',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            DataCell(
              Text('tzx2y3',
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
    ];
  }

  DataTable _createLotWarehousingDataTable() {
    return DataTable(
      columns: _createLotWarehousingColumns(),
      rows: _createLotWarehousingRows(),
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
            automaticallyImplyLeading: true,
            title: const Text('8010 - 입고 검수 등록'),
            leading: IconButton(icon: const Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            )
          ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createRcvDataTable(),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  child: Row(
                    children: [
                      // Star
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(
                                Icons.star,
                                color: Colors.red
                            ),
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
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
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
                const SizedBox(
                  height: 10.0,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _createItemsDetailDataTable(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                        SizedBox(
                          width: 600,
                          child: Row(
                            children: const [
                              Icon(
                                  Icons.star,
                                  color: Colors.red
                              ),
                              Text(
                                '입고 LOT',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: _createLotWarehousingDataTable(),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width: 50.0
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            child: const Text(
                              'LOT 추가',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            child: const Text(
                              'LOT 삭제',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20.0
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        child: const Text(
                          'LOT 저장',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
      ),
    );
  }
}
