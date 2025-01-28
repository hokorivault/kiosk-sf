class AcctInfoList {
  final String cust_cd;
  final String cust_nm;
  final String cust_type_nm;
  final String ceo_nm;
  final String tel_no;
  final String zip_cd;
  final String addr;
  final String addr_detail;

  AcctInfoList({
    required this.cust_cd,
    required this.cust_nm,
    required this.cust_type_nm,
    required this.ceo_nm,
    required this.tel_no,
    required this.zip_cd,
    required this.addr,
    required this.addr_detail,
  });

  factory AcctInfoList.fromJson(Map<String, dynamic> json) => AcctInfoList(
      cust_cd: json['CUST_CD'],
      cust_nm: json['CUST_NM'],
      cust_type_nm: json['CUST_TYPE_NM'],
      ceo_nm: json['CEO_NM'],
      tel_no: json['TEL_NO'],
      zip_cd: json['ZIP_CD'],
      addr: json['ADDR'],
      addr_detail: json['ADDR_DETAIL']
  );
}