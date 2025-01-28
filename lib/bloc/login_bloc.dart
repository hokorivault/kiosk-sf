import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kiosk_sf/services/mes_server_connection.dart';
import 'package:kiosk_sf/models/gms_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  SharedPreferences? settingPref;
  bool isToRemeber = false;
  String lang = "ENG";
  String loginMSG = "";
  TextEditingController usrnmCntrl = new TextEditingController();
  TextEditingController pwdCntrl = new TextEditingController();

  Future<int> login() async {
    int isSuccess = 0;
    //String address = "http://factopia.co.kr/baseinfo/login.do";
    String address = "http://192.168.0.188:8081/iUp_MES/baseinfo/login.do";

    if (usrnmCntrl.text.isEmpty || pwdCntrl.text.isEmpty) {
      loginMSG = "Please enter your username and password.";
      return 0;
    }

    MESServerConnection mesConn = MESServerConnection();
    Response res = await mesConn.connectAPI(HttpMethod.POST, address, {
      "paramMap": {
        "USERID": usrnmCntrl.text,
        "PASSWORD": pwdCntrl.text,
        "LANGUAGE": "ENG",
        "LOGINYN": "Y"
      }
    });

    //SharedPreferences sharedPref = await SharedPreferences.getInstance();


    if (res.statusCode == 200) {
      Map<String, dynamic> reqInfo = jsonDecode(res.body);

      // SharedPreferences sharedPrefJSession = await SharedPreferences.getInstance();
      // await sharedPrefJSession.setString("login_info", reqInfo['dataset']["ds_loginInfo"].toString());
      // print('sharedPrefJSession: ${sharedPrefJSession.getString("login_info")}');

      // SharedPreferences sharedPrefJSession = await SharedPreferences.getInstance();
      // await sharedPrefJSession.setString("login_session", res.headers['set-cookie'].toString());
      // print('sharedPrefJSession: ${sharedPrefJSession.getString("login_session")}');

      if (reqInfo["code"] < 0) {
        loginMSG = reqInfo["code"] == -1
            ? "Account is currently used."
            : "Account session has expired.";
        return reqInfo["code"];
      }

      List<dynamic> loginfo = reqInfo["dataset"]["ds_loginInfo"];
      //print(loginfo);
      if (loginfo.length == 0 ||
          loginfo.isEmpty ||
          loginfo[0]["LOGINYN"] == "N") {
        loginMSG = "The username or password you entered is incorrect.";
        return 0;
      }

      if (loginfo[0]["LOGINYN"].toString() == "Y") {
        Map<String, dynamic> dataset = reqInfo["dataset"];

        loginfo[0]["LAKEY"] = lang;
        loginfo[0]["PASSWORD"] = pwdCntrl.text;

        dataset["ds_loginInfo"] = loginfo;
        GmsUser userinfo = GmsUser(dataset);
        //serinfo.checkDataSets();
        isSuccess = 1;
      }
    }

    return isSuccess;
  }

  Future<int> logout() async {
    int isSuccess = 0;
    //String address = "http://factopia.co.kr/MES/baseinfo/logout.do";
    String address = "http://192.168.0.188:8082/iUp_MES/baseinfo/logout.do";

    MESServerConnection mesConn = MESServerConnection();
    try {
      await mesConn.connectAPI(HttpMethod.POST, address, {
        "paramMap": {
          "LASTLOGINDATE":"20211209154250",
          "SERVERID":"localhost",
          "IPADDR":"127.0.0.1",
          "LSCOUNT":999,
          "URGRKEY":"SYSADM",
          "LOGINFAILCOUNT":0,
          "LSBEGIN":"20200922100739",
          "LOGGRPCD":null,
          "DELYN":"N",
          "RSTCDIV":null,
          "LASTPWDATE":"20180101",
          "CTNAME":"1001",
          "CP":null,
          "LOGINYN":"Y",
          "DIVCD":null,
          "GROUPID":1,
          "USRTYP":null,
          "SYSGB":"MES",
          "USERNM":"jpim",
          "CURR_SCENARIOID":86,
          "CTKEY":"1001",
          "RSTCLGST":null,
          "LSYN":"Y",
          "LAKEY":"ENG",
          "SCREENWIDTH":1536,
          "PGMGBN":"U",
          "USERID": usrnmCntrl.text,
          "PASSWORD": pwdCntrl.text,
          "LANGUAGE": "ENG",
          "LOGINYN": "Y"
        }
      });
      return isSuccess;
    } catch (e) {
      throw e;
    }
  }

  Future<SharedPreferences?> sharedPrefInit() async {
    if (settingPref != null) return this.settingPref;

    try {
      Future<SharedPreferences> prefInstance = SharedPreferences.getInstance();
      this.settingPref = await prefInstance;
    } catch (error) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
      Future<SharedPreferences> prefInstance = SharedPreferences.getInstance();
      this.settingPref = await prefInstance;
    }

    return this.settingPref;
  }

  void loadSaveInfo() {
    if (settingPref!.getBool("isToRemember") != null &&
        settingPref!.getBool("isToRemember") == true) {
      usrnmCntrl.text = settingPref!.getString("usrname").toString();
      pwdCntrl.text = settingPref!.getString("pwd").toString();
      isToRemeber = settingPref!.getBool("isToRemember")!;
      lang = settingPref!.getString("language").toString();
    }
  }

  ///Store user config into Shared Preference
  Future<void> saveSettings() async {
    if (isToRemeber) {
      if (settingPref == null) {
        SharedPreferences? res = await this.sharedPrefInit();

        res!.setString("usrname", usrnmCntrl.text.trim());
        res.setString("pwd", pwdCntrl.text.trim());
        res.setString("lang", lang.trim());
        res.setBool("isToRemember", isToRemeber);
      }
    }
  }
}
