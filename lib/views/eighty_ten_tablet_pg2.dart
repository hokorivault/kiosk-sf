import 'package:flutter/material.dart';

import 'package:kiosk_sf/route/route.dart' as route;

import 'package:flutter_bloc/flutter_bloc.dart';

//cubits
import 'package:kiosk_sf/cubits/8010/receiving_lists_cubit.dart';
import 'package:kiosk_sf/cubits/8010/receiving_lists_states.dart';
import 'package:kiosk_sf/cubits/8010/receiving_list_detail_cubit.dart';
import 'package:kiosk_sf/cubits/8010/receiving_list_detail_states.dart';
import 'package:kiosk_sf/cubits/8010/lot_warehousing_lists_cubit.dart';
import 'package:kiosk_sf/cubits/8010/lot_warehousing_lists_states.dart';
import 'package:kiosk_sf/cubits/rst/rst_response_cubit.dart';

//widgets
import 'package:kiosk_sf/widgets/custom_progress_indicator.dart';
import 'package:kiosk_sf/widgets/custom_dialog_info.dart';

//variables
import 'package:kiosk_sf/variables/8010/eighty_ten_columns.dart';

class EightyTenTabletPg2 extends StatefulWidget {
  late String recvNo;

  EightyTenTabletPg2({Key? key, required this.recvNo}) : super(key: key);


  @override
  _EightyTenTabletPg2State createState() => _EightyTenTabletPg2State();
}

class _EightyTenTabletPg2State extends State<EightyTenTabletPg2> {

  String accountName = 'jpim';
  String accountEmail = 'jpim@test.com';

  Map<String, dynamic> datamap_10Q = {};
  Map<String, dynamic> datamap_20Q = {};
  Map<String, dynamic> datamap_30Q = {};
  Map<String, dynamic> combinedMap = {};
  List<dynamic> selectedRows_30Q = [];
  List<dynamic> dataList20Q = [];

  List<String> addLotDataList = [];


  final managedDateController = TextEditingController();
  final expiryDateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    managedDateController.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

  int selectedIndex_10Q = -1;
  int selectedIndex_20Q = -1;
  int selectedIndex_30Q = -1;

  void handleSelectedIndex(int val, String origin) {
    print('val: $val\norigin: $origin');
    setState(() {
      print('selectedIndex is $val');
    });

    // Useful for navigating to different data
    // if(val == 0) {
    //   Navigator.pushNamed(context, route.eightyTenTabletPg2)
    // }
  }

  List<DataColumn> _createColumns_10Q() {
    return [
      const DataColumn(
        label: Text(
          'Date Received',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Queue',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Receiving Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Supplier code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Supplier Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Receiving Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Count',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    ];
  }
  // Receiving List
  List<DataRow> _createRows_10Q(receivingList) {

    List<DataRow> rcvRows = [];

    if(receivingList.length > 0) {
      for(int x=0; x < receivingList.length; x++ ) {


        rcvRows.add(
            DataRow(
                selected: 0 == 0,
                onSelectChanged: (val) {
                  setState(() {
                    datamap_10Q = {};
                    datamap_10Q['rcv_dt'] = receivingList[x].rcv_dt;
                    datamap_10Q['rcv_seq']  = receivingList[x].rcv_seq;
                    //print("datamap10Q: ${datamap10Q['rcv_dt']} ${datamap10Q['rcv_seq']}");
                    selectedIndex_10Q = 0;
                  });
                  // handleSelectedIndex((x+1), '10Q');
                },
                cells: [
                  DataCell(
                      Text(receivingList[x].rcv_dt)
                  ),
                  DataCell(
                      Text(receivingList[x].rcv_seq.toString())
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
    label: Text(column),
  )).toList();



  DataTable _createDataTable_10Q(state) {
    return DataTable(
      // showCheckboxColumn: false,
      columns:  getColumns(EightyTenColumns().columns_10Q),
      rows: _createRows_10Q(state.rcvLists),
      onSelectAll: (isSelectedAll) {
        // Utils.showSnackBar(context, 'All Selected: $isSelectedAll');
      },
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
      // dataRowColor: MaterialStateColor.resolveWith(
      //         (states) => const Color(0xFFC5CAE9)
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F51B5),
          width: 3,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(10)),
      ),
    );
  }

  List<DataColumn> _createColumns_20Q() {
    return [
      const DataColumn(
        numeric: true,
        label: Text(
          'No',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      // DataColumn(
      //   label: Checkbox(
      //     value: false, onChanged: (bool? value){value = value;},
      //   ),
      // ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Queue',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Receiving Status',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Item Code',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Item Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Unit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Unit(Mng)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Expiration Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Shelf Life',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Order Qty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Received Qty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        numeric: true,
        label: Text(
          'Inspected Qty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      const DataColumn(
        label: Text(
          'Storage Loc',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    ];
  }

  List<DataRow> _createRows_20Q(rcvListDetail) {

    List<DataRow> rcvDetailRows = [];

    if(rcvListDetail.length > 0) {
      for(int x=0; x < rcvListDetail.length; x++ ) {

        rcvDetailRows.add(
            DataRow(
                // onSelectChanged: (val) {
                //   handleSelectedIndex((x+1),'20Q');
                // },
                selected: x == selectedIndex_20Q,
                onSelectChanged: (val) {
                  setState(() {
                    datamap_20Q = {};
                    combinedMap = {};
                    datamap_20Q['dtl_seq'] = rcvListDetail[x].dtl_seq;
                    combinedMap['rcv_dt'] = datamap_10Q['rcv_dt'];
                    combinedMap['rcv_seq'] = datamap_10Q['rcv_seq'];
                    combinedMap['dtl_seq'] = datamap_20Q['dtl_seq'];
                    combinedMap['lot_seq'] = '';
                    combinedMap['item_cd'] = rcvListDetail[x].item_cd;
                    dataList20Q.add(combinedMap);
                    //dataList20Q[x] = combinedMap;
                    //print('combinedMap: $combinedMap');
                    print('dataList20Q: $dataList20Q');
                    //print('dataList20Q[0].item_cd: ${dataList20Q[0]['item_cd']}');
                    selectedIndex_20Q = x;
                  });
                },
                cells: [
                  DataCell(
                      Text('${x+1}')
                  ),
                  DataCell(
                      Text(rcvListDetail[x].dtl_seq.toString())
                  ),
                  DataCell(
                      Text(rcvListDetail[x].rcv_status_nm)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].item_cd)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].item_nm)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].item_unit)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].item_mng_unit_nm)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].vld_mng_type_nm)
                  ),
                  DataCell(
                      Text(rcvListDetail[x].vld_day.toString())
                  ),
                  DataCell(
                      Text(rcvListDetail[x].ord_qty.toString())
                  ),
                  DataCell(
                      Text(rcvListDetail[x].rcv_qty.toString())
                  ),
                  DataCell(
                      Text(rcvListDetail[x].insp_qty.toString())
                  ),
                  DataCell(
                      Text(rcvListDetail[x].keep_loc.toString())
                  ),
                ]
            )
        );
      }

    } else {
      rcvDetailRows.add(
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
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
                DataCell(Text('')),
              ]
          )
      );
    }
    return rcvDetailRows;
  }

  DataTable _createDataTable_20Q(state) {
    return DataTable(
      onSelectAll: (val) {
        setState(() {
          selectedIndex_20Q = -1;
        });
      },
      columns: getColumns(EightyTenColumns().columns_20Q),
      rows: _createRows_20Q(state.rcvListDetail),
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
      // dataRowColor: MaterialStateColor.resolveWith(
      //         (states) => const Color(0xFFC5CAE9)
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F51B5),
          width: 3,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(10)),
      ),
    );
  }

  List<DataRow> _createRows_30Q(lotWarehousingLists) {

    List<DataRow> lotWarehousingRows = [];

    for(int x=0; x < lotWarehousingLists.length; x++ ) {
      lotWarehousingRows.add(
          DataRow(
              //selected: selectedRows_30Q.contains(lotWarehousingLists[x].lot_seq.toString()),
              selected: x == selectedIndex_30Q,
              onSelectChanged: (val) {
                setState(() {
                  datamap_30Q = {};
                  datamap_30Q['lot_seq'] = lotWarehousingLists[x].lot_seq;
                  //selectedRows_30Q.add(lotWarehousingLists[x].lot_seq.toString());
                  print("datamap_30Q['lot_seq']: ${datamap_30Q['lot_seq']}");
                  selectedIndex_30Q = x;
                });
              },
              cells: [
                DataCell(
                    Text('${x+1}')
                ),
                DataCell(
                    Text(lotWarehousingLists[x].lot_seq.toString())
                ),
                DataCell(
                    Text(lotWarehousingLists[x].vld_dt,
                      style: const TextStyle(
                      fontSize: 15.0,
                    ),)
                ),
                DataCell(
                    Text(lotWarehousingLists[x].lot_no)
                ),
                DataCell(
                    Text(lotWarehousingLists[x].rcv_qty.toString())
                ),
              ]
          )
      );
    }
    return lotWarehousingRows;
  }

  DataTable _createDataTable_30Q(state) {

    return DataTable(
      onSelectAll: (val) {
        setState(() {
          selectedIndex_30Q = -1;
        });
      },
      columns: getColumns(EightyTenColumns().columns_30Q),
      rows: _createRows_30Q(state.lotWarehousingLists),
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
      // dataRowColor: MaterialStateColor.resolveWith(
      //         (states) => const Color(0xFFC5CAE9)
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF3F51B5),
          width: 3,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(10)),
      ),
    );
  }

  Widget buildCommonBtn({
    required String text,
    required String color,
    VoidCallback? onTap
  }) {

    MaterialColor appliedColor = Colors.blue;

    if(color == 'red') {
      appliedColor = Colors.red;
    }

    if(text.contains('Add')) {
      return SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: appliedColor,
          ),
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onTap,
        ),
      );
    } else {
      return SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: appliedColor,
          ),
          onPressed: onTap,
        ),
      );
    }


  }

  Widget buildDatePicker({
    VoidCallback? onTap
  }) {

    return SizedBox(
      width: 135,
      child: TextField(
        controller: managedDateController,
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
          managedDateController.text = startDate.toString().substring(0,10);
        },
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 4:
        print('Index is: $index\ndataList20Q: ${dataList20Q}');
        Navigator.pushNamed(context, route.eightyTenAddLot, arguments: dataList20Q);
        break;
      case 6:
        print('Index is: $index\ndataList20Q: ${dataList20Q}');

        break;
      default:
        throw('The route does not exist yet.');
    }
  }

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
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ReceivingListsCubit>(
              create: (context) => ReceivingListsCubit()..getRcvwork8010F_10Q(widget.recvNo),
            ),
            //..getRcvwork8010F_20Q('20211230', '2')
            BlocProvider<ReceivingListDetailCubit>(
              create: (context) => ReceivingListDetailCubit(),
            ),
            //..getRcvWork8010F_30Q('20211230', '2', '1')
            BlocProvider<LotWarehousingListsCubit>(
              create: (context) => LotWarehousingListsCubit(),
            ),
            BlocProvider<RstResponseCubit>(
              create: (context) => RstResponseCubit(),
            ),
          ],
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Builder(
                  builder: (context) {
                    return BlocBuilder<ReceivingListsCubit, ReceivingListsStates>(
                      // listener: (context, state) {
                      //   if (state is rlLoadedState) {
                      //     context.read<ReceivingListDetailCubit>().getRcvwork8010F_20Q(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq']);
                      //     print("10Q listener\ndatamap_10Q['rcv_dt']: ${datamap_10Q['rcv_dt']}");
                      //     //context.read<ReceivingListDetailCubit>().getRcvwork8010F_20Q(datamap10Q['rcv_dt'], datamap_10Q['rcv_seq']);
                      //   }
                      // },
                      builder: (context, state) {
                        context.read<ReceivingListDetailCubit>().getRcvwork8010F_20Q(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq']);
                        if(state is rlLoadingState) {
                          return const CustomProgressIndicator();
                        } else if(state is rlLoadedState) {
                          return _createDataTable_10Q(state);
                          //return _buildDataTable(state, '10Q');
                        } else if(state is rlSessionExpired) {
                          return CustomDialogInfo();
                        }  else {
                          return Text('No Rows to show');
                        }
                      },
                    );
                  }
                ),
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
                              'Items Ordered To Be Received',
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
                            buildCommonBtn(
                                text: 'Issue LOT Label',
                                color: '',
                                onTap: () => selectedItem(context, 1)
                            ),
                            const SizedBox(
                              width: 80.0,
                            ),
                            buildCommonBtn(
                                text: 'Confirmation',
                                color: '',
                                onTap: () => selectedItem(context, 1)
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            buildCommonBtn(
                                text: 'Insp Cancel',
                                color: 'red',
                                onTap: () => selectedItem(context, 1)
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: BlocBuilder<ReceivingListDetailCubit, ReceivingListDetailStates>(
                        // listener: (context, state) {
                        //   if(state is rldLoadedState) {
                        //     print('listener 20Q');
                        //     print("datamap_10Q['rcv_dt']: ${datamap_10Q['rcv_dt']}\ndatamap10Q['rcv_seq']: ${datamap_10Q['rcv_seq']}\ndatamap20Q['dtl_seq']: ${datamap_20Q['dtl_seq']}");
                        //     //context.read<ReceivingListDetailCubit>().getRcvwork8010F_20Q(datamap10Q['rcv_dt'], datamap_10Q['rcv_seq']);
                        //     context.read<LotWarehousingListsCubit>().getRcvWork8010F_30Q(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq'], datamap_20Q['dtl_seq']);
                        //   }
                        // },
                        builder: (context, state) {
                          context.read<LotWarehousingListsCubit>().getRcvWork8010F_30Q(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq'], datamap_20Q['dtl_seq']);
                          if(state is rldLoadingState) {
                            return const CustomProgressIndicator();
                          } else if(state is rldLoadedState) {
                            return _createDataTable_20Q(state);
                          } else {
                            return Text('No Rows to show');
                          }
                        }
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Column(children: [
                  SizedBox(
                    width: 700,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Icon(
                                  Icons.star,
                                  color: Colors.red
                              ),
                              Text(
                                'LOT Warehousing',
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
                              buildCommonBtn(
                                  text: 'Add LOT',
                                  color: '',
                                  onTap: () => selectedItem(context, 4)
                              ),
                              const SizedBox(
                                  width: 25.0
                              ),
                              SizedBox(
                                height: 50, //height of button
                                child: Builder(
                                    builder: (context) {
                                      return ElevatedButton.icon(
                                          label: const Text(
                                            'Delete Lot',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                          ),
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            print("datamap_10Q['rcv_dt']: ${datamap_10Q['rcv_dt']}\ndatamap_10Q['rcv_seq']: ${datamap_10Q['rcv_seq'].toString()}\ndatamap_20Q['dtl_seq']: ${datamap_20Q['dtl_seq'].toString()}\ndatamap_30Q['lot_seq']: ${datamap_30Q['lot_seq'].toString()}");
                                            BlocProvider.of<RstResponseCubit>(context).delLotRcvwork8010F_40W(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq'], datamap_20Q['dtl_seq'], datamap_30Q['lot_seq']);
                                          }
                                      );
                                    }
                                ),
                              ),
                              // buildCommonBtn(
                              //     text: 'Delete LOT',
                              //     color: 'red',
                              //     onTap: () => selectedItem(context, 6)
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    child: BlocBuilder<LotWarehousingListsCubit, LotWarehousingListsStates>(
                      // listener: (context, state) {
                      //   if(state is lwlLoadedState) {
                      //     print('listener 30Q');
                      //     //context.read<LotWarehousingListsCubit>().getRcvWork8010F_30Q(datamap_10Q['rcv_dt'], datamap_10Q['rcv_seq'], datamap_20Q['dtl_seq']);
                      //   }
                      // },
                      builder: (context, state) {
                        if(state is lwlLoadingState) {
                          return const CustomProgressIndicator();
                        } else if(state is lwlLoadedState) {
                          return _createDataTable_30Q(state);
                        } else {
                          return const Text('No Rows to show');
                        }
                      }
                    ),
                  ),
                ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
