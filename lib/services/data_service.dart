import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:kiosk_sf/services/mes_server_connection.dart';
import 'package:kiosk_sf/models/gms_user.dart';

// 0120P model
import 'package:kiosk_sf/models/0120P/acct_info_list.dart';

// 8010 models
import 'package:kiosk_sf/models/8010/receiving_list.dart';
import 'package:kiosk_sf/models/8010/receiving_list_detail.dart';
import 'package:kiosk_sf/models/8010/lot_warehousing_list.dart';
import 'package:kiosk_sf/models/post.dart';

// rst model
import 'package:kiosk_sf/models/rst/rst_response.dart';

import 'package:kiosk_sf/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DataService {

  String loginMSG = "";
  String lang = "ENG";
  String _baseUrl = "http://192.168.0.188:8081/iUp_MES";
  //String _baseUrl = "http://192.168.0.188:8081/MES/";
  //String _baseUrl = "http://factopia.co.kr/MESCloud";

  final _jsonplaceholderUrl = 'jsonplaceholder.typicode.com';

  Future<int> mesLogin(user, pass) async {

    int isSuccess = 0;
    MESServerConnection mesConn = MESServerConnection();
    String address = _baseUrl + "/baseinfo/login.do";
    final response = await mesConn.connectAPI(HttpMethod.POST, address, {
      "paramMap": {
        "USERID": user,
        "PASSWORD": pass,
        "LANGUAGE": "ENG",
        "LOGINYN": "Y"
      }
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> reqInfo = jsonDecode(response.body);
      print('response.body is: ${jsonDecode(response.body)["dataset"]["ds_loginInfo"]}');

      String rawJsessionId = response.headers['set-cookie'].toString();
      String extractJsessionId = rawJsessionId.substring(11,43);
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      loginInfoSession.clear();
      await loginInfoSession.setString('jsessionid', extractJsessionId );

      print('from res headers: ${rawJsessionId}\nsharedpref: ${loginInfoSession.getString('jsessionid')}');

      if (reqInfo["code"] < 0) {
        loginMSG = reqInfo["code"] == -1
            ? "Account is currently used."
            : "Account session has expired.";
        return reqInfo["code"];
      }

      List<dynamic> loginfo = reqInfo["dataset"]["ds_loginInfo"];

      await loginInfoSession.setString('ctkey', loginfo[0]['CTKEY'] );
      //print('ctkey is: ${loginInfoSession.getString('ctkey')}');

      //print(loginfo[0]["LOGINYN"].toString());
      if (loginfo.isEmpty ||
          loginfo.isEmpty ||
          loginfo[0]["LOGINYN"] == "N") {
        loginMSG = "The username or password you entered is incorrect.";
        return 0;
      }

      if (loginfo[0]["LOGINYN"].toString() == "Y") {
        Map<String, dynamic> dataset = reqInfo["dataset"];

        loginfo[0]["LAKEY"] = lang;
        loginfo[0]["PASSWORD"] = pass;

        dataset["ds_loginInfo"] = loginfo;

        GmsUser userinfo = GmsUser(dataset);
        //userinfo.checkDataSets();
        isSuccess = 1;
      }
    }
    else {
      print('status code is: ${response.statusCode}');
    }

    return isSuccess;
  }

  Future<List<RstResponse>> addLotRcvwork8010F_40W(String mngDate, String vldDate, String lotNo, String inspectedQty, String rcvDt, int dtlSeq, String itemCd) async {
    try {

      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      print('jsessionid: $extractJsessionId\nmngDateStr: $mngDate\nexpiryDateStr: $vldDate\nLot: $lotNo\ninspected qty: $inspectedQty');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl + "/rcvwork8010FManagement/saveRcvwork8010F_40W;jsessionid=${extractJsessionId}";
      final http.Response response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_master_40W":[{
            "MNG_DT": mngDate,
            "VLD_DT": vldDate,
            "LOT_NO": lotNo,
            "RCV_QTY": inspectedQty,
            "COMP_CD": ctkey,
            "RCV_DT":rcvDt,
            "RCV_SEQ":1,
            "DTL_SEQ":dtlSeq,
            "LOT_SEQ":"",
            "ITEM_CD":itemCd,
            "PD_MODE":"C",
            "ROWTYPE":1
          }]
        }
      });

      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_master_40W"];

      print('40W response: $json');
      final rstResponse = json.map((rstResponse) => RstResponse.fromJson(rstResponse)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');


      if (response.statusCode == 200) {
        return rstResponse;
      } else {
        return <RstResponse>[];
      }

      //return 'test';

    } catch (e) {
      rethrow;
    }
  }

  Future<List<RstResponse>> delLotRcvwork8010F_40W(String rcvDt, int rcvSeq, int dtlSeq, int lotSeq) async {
    try {

      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl + "/rcvwork8010FManagement/saveRcvwork8010F_40W;jsessionid=${extractJsessionId}";
      final http.Response response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_master_40W":[{
            "COMP_CD": ctkey,
            "RCV_DT":rcvDt,
            "RCV_SEQ":rcvSeq, //previously default to 1
            "DTL_SEQ":dtlSeq,
            "LOT_SEQ":lotSeq, //previously blank
            "ROWTYPE":3,
            "PD_MODE":"D",
          }]
        }
      });

      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_master_40W"];

      print('40W response: $json');
      final rstResponse = json.map((rstResponse) => RstResponse.fromJson(rstResponse)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');


      if (response.statusCode == 200) {
        return rstResponse;
      } else {
        return <RstResponse>[];
      }

      //return 'test';

    } catch (e) {
      rethrow;
    }
  }

  Future<List<AcctInfoList>> getComCust0120_10Q(custNm, custType) async {
    try {
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl + "/commonPopupManagement/getComCust0120_10Q;jsessionid=${extractJsessionId}";
      final response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_cond_CustPopup":[{
            "PD_MODE":"R",
            "PD_VALUE1":"$ctkey||$custNm||$custType||",
            "PD_VALUE2":"||}"
          }]
        }
      });

      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_cond_CustPopup"];

      //List<dynamic> json = jsonDecode(response.body)["dataset"]["ds_cond_CustPopup"];

      print('getComCust0120_10Q json response: $json');
      final acctInfoLists = json.map((acctInfoJson) => AcctInfoList.fromJson(acctInfoJson)).toList();
      print('runtimeType is: ${acctInfoLists.runtimeType}');

      if (response.statusCode == 200) {
        return acctInfoLists;
      } else {
        return <AcctInfoList>[];
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReceivingList>> getRcvWork8011P_10Q(startDate, endDate, rcvTypeNm, custCd) async {

    try {
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      //print('ctkey: $ctkey\nstartDate: $startDate\nendDate: $endDate\nrcvTypeNm: $rcvTypeNm\ncustCd: $custCd');
      print('rcvTypeNm: $rcvTypeNm\ncustCd: $custCd');
      if(custCd.isEmpty) {
        custCd = '';
      }

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl + "/rcvwork8011PManagement/getRcvwork8011P_10Q;jsessionid=${extractJsessionId}";
      final response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_cond":[{
            "PD_MODE":"R",
            "PD_VALUE1":"$ctkey||$startDate||$endDate||||$rcvTypeNm||$custCd||",
            "PD_VALUE2":"||}"
          }]
        }
      });

      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_master_10Q"];

      //List<dynamic> json = jsonDecode(response.body)["dataset"]["ds_master_10Q"];

      //print('getRcvWork8011P json response: $json');

      final rcvLists = json.map((rcvJson) => ReceivingList.fromJson(rcvJson)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');

      if (response.statusCode == 200) {
        return rcvLists;
      } else {
        return <ReceivingList>[];
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReceivingList>> getRcvwork8010F_10Q(rcvNo) async {

    try {
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      //print('8010F_10Q\nctkey: $ctkey\nRCV_NO: $rcvNo');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl+"/rcvwork8010FManagement/getRcvwork8010F_10Q;jsessionid=${extractJsessionId}";

      final response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_cond":[{
            "PD_MODE":"R",
            "PD_VALUE1":"$ctkey||$rcvNo||","PD_VALUE2":"||}"
          }]
        }
      });
      if( response == null) {
        print('response is null!');
        print('response is null!');
      }
      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      print('reqInfo: $reqInfo');

      List<dynamic> json = reqInfo["dataset"]["ds_master_fields_10Q"];

      //List<dynamic> json = jsonDecode(response.body)["dataset"]["ds_master_fields_10Q"];

      print('getRcvwork8010F_10Q json response: $json');
      final receivingList = json.map((receivingListJson) => ReceivingList.fromJson(receivingListJson)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');
      print("response.statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        return receivingList;
      } else if(response.statusCode == 401) {
        return [];
      } else {
        return <ReceivingList>[];
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<ReceivingListDetail>> getRcvwork8010F_20Q(rcvDt, rcvSeq) async {

    try {
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      //print('_20Q\nctkey: $ctkey\nRCV_DT: $rcvDt\nRCV_SEQ: $rcvSeq');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl+"/rcvwork8010FManagement/getRcvwork8010F_20Q;jsessionid=${extractJsessionId}";
      final response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_cond_20Q":[{
            "PD_MODE":"R",
            "PD_VALUE1":"$ctkey||$rcvDt||$rcvSeq||",
            "PD_VALUE2":"||}"
          }]
        }
      });

      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_master_20Q"];

      //List<dynamic> json = jsonDecode(response.body)["dataset"]["ds_master_20Q"];

      //print('getRcvwork8010F_20Q json response: $json');
      final receivingListDetailLists = json.map((receivingListDetailJson) => ReceivingListDetail.fromJson(receivingListDetailJson)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');

      if (response.statusCode == 200) {
        return receivingListDetailLists;
      } else {
        return <ReceivingListDetail>[];
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<LotWarehousingList>> getRcvWork8010F_30Q(rcvDt, rcvSeq, dtlSeq) async {

    try {
      SharedPreferences loginInfoSession = await SharedPreferences.getInstance();
      String? extractJsessionId = loginInfoSession.getString('jsessionid');
      String? ctkey = loginInfoSession.getString('ctkey');

      //print('ctkey: $ctkey\nRCV_DT: $rcvDt\nRCV_SEQ: $rcvSeq\nDTL_SEQ: $dtlSeq');

      MESServerConnection mesConn = MESServerConnection();
      String address = _baseUrl+"/rcvwork8010FManagement/getRcvwork8010F_30Q;jsessionid=${extractJsessionId}";
      final response = await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap":{},
        "dataSetMap":{
          "ds_cond_30Q":[{
            "PD_MODE":"R",
            "PD_VALUE1":"$ctkey||$rcvDt||$rcvSeq||$dtlSeq||",
            "PD_VALUE2":"||}"
          }]
        }
      });
      Map<String, dynamic> reqInfo = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> json = reqInfo["dataset"]["ds_master_30Q"];
      //List<dynamic> json = jsonDecode(response.body)["dataset"]["ds_master_30Q"];

      //print('getRcvWork8010F_30Q json response: $json');
      final lotWarehousingLists = json.map((lotWarehousingJson) => LotWarehousingList.fromJson(lotWarehousingJson)).toList();
      //print('runtimeType is: ${rcvLists.runtimeType}');

      if (response.statusCode == 200) {
        return lotWarehousingLists;
      } else {
        return <LotWarehousingList>[];
      }

    } catch (e) {
      rethrow;
    }
  }
}
