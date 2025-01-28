import 'package:flutter/material.dart';
import 'package:kiosk_sf/navbar.dart';

class EightySeventy extends StatelessWidget {
  const EightySeventy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
              automaticallyImplyLeading: true,
              title: const Text('8070 - Production Performance Registration'),
              leading: IconButton(icon: const Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
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
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        //1st Row
                                        Row(
                                          children: const <Widget>[
                                            Text(
                                              '지시번호',
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
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
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
                                            Text('생산품목',
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  fillColor: Colors.grey,
                                                  filled: true,
                                                  hintText: '11000001',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        // 3rd Row
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: const <Widget>[
                                              Text(
                                                '환산중량',
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
                                                  decoration: InputDecoration(
                                                    border:
                                                    OutlineInputBorder(),
                                                    fillColor: Colors.grey,
                                                    filled: true,
                                                    hintText: '1',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                              '지시일자',
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
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  fillColor: Colors.grey,
                                                  filled: true,
                                                  hintText: '11-16-2021',
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
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border:
                                                    OutlineInputBorder(),
                                                    fillColor: Colors.grey,
                                                    filled: true,
                                                    hintText: '품목명'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        // 3rd Row
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: const <Widget>[
                                              Text(
                                                '유효기한일수',
                                                style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border:
                                                    OutlineInputBorder(),
                                                    fillColor: Colors.grey,
                                                    filled: true,
                                                    hintText: '365',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                              '지시순번',
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
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  fillColor: Colors.grey,
                                                  filled: true,
                                                  hintText: '001',
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
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  fillColor: Colors.grey,
                                                  filled: true,
                                                  hintText: '20g * 30포',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  fillColor: Colors.grey,
                                                  filled: true,
                                                  hintText: 'SET',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        // 3rd Row
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: const <Widget>[
                                              Text(
                                                '제품구성수량',
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
                                                  decoration: InputDecoration(
                                                      border:
                                                      OutlineInputBorder(),
                                                      fillColor: Colors.grey,
                                                      filled: true,
                                                      hintText: '30'),
                                                ),
                                              ),
                                            ],
                                          ),
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
                    Column(
                      children: [
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
                                Column(
                                  children: const <Widget>[
                                    Text('전체\n실적',
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    //1st Row
                                    Row(
                                      children: const <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            '지시수량',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.greenAccent,
                                              filled: true,
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
                                        Text('실적(양품)',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.lightBlueAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    // 3rd Row
                                    Row(
                                      children: const <Widget>[
                                        Text(
                                          '실적(불량)',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.lightBlueAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    //4th row
                                    Row(
                                      children: const <Widget>[
                                        Text('실적(합계)',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.redAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('작업시작'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 50.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('작업완료'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 300.0,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: const <Widget>[
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text('수기 등록',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 100.0,
                                  ),
                                  Text('Barcode SCAN',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.yellowAccent,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.0,
                                  ),
                                  Text('작업자',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey,
                                        filled: true,
                                        hintText: '홍길동',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: const <Widget>[
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text('실적일자',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: '2021-11-17'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.0,
                                  ),
                                  Text('실적순번',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: 100.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey,
                                        filled: true,
                                        hintText: '자동',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                ],
                              ),
                              Row(
                                children: const <Widget>[
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text('공장코드',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.0,
                                  ),
                                  Text('생산라인',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: 100.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.0,
                                  ),
                                  Text('유효기한',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          fillColor: Colors.grey,
                                          filled: true,
                                          hintText: '2021-11-17'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black87, // red as border color
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: const <Widget>[
                                    Text('작업자 실적',
                                        style: TextStyle(
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    // 2nd row
                                    Row(
                                      children: const <Widget>[
                                        Text('실적(불량)',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.lightBlueAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    // 3rd Row
                                    Row(
                                      children: const <Widget>[
                                        Text(
                                          '실적(불량)',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.lightBlueAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    //4th row
                                    Row(
                                      children: const <Widget>[
                                        Text('실적(합계)',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              fillColor: Colors.redAccent,
                                              filled: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}