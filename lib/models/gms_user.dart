class GmsUser {
  Map<String, dynamic>? _dataset;
  List<dynamic>? _dsLoginInfo;
  List<dynamic>? _gdsMessage;
  List<dynamic>? _gdsGlobalSetting;
  Map<String, dynamic>? _dsLabel;
  List<dynamic>? _gdsSysGb;

  GmsUser(Map<String, dynamic> dataset) {
    this._dataset = dataset;
    fromJson(dataset);
  }

  void fromJson(Map<String, dynamic> dataset) {
    this._dsLoginInfo = dataset['ds_loginInfo'];
    this._gdsMessage = dataset['gds_message'];
    this._gdsGlobalSetting = dataset['gds_GlobalSetting'];
    this._dsLabel = dataset['ds_label'];
    this._gdsSysGb = dataset['gds_sysGb'];
  }

  /* Getters */
  get dataset => _dataset;
  get loginInfo => _dsLoginInfo;
  get gdsMessage => _gdsMessage;
  get globalSetting => _gdsGlobalSetting;
  get dsLabel => _dsLabel;
  get sysGb => _gdsSysGb;

  // void checkDataSets() {
  //   print(_dsLoginInfo);
  //   print(_gdsMessage);
  //   print(_gdsGlobalSetting);
  //   print(_dsLabel);
  //   print(_gdsSysGb);
  // }
}
