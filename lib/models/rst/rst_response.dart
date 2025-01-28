class RstResponse {
  final String rst_value;
  final int rst_cd;
  final String rst_nm;

  RstResponse({required this.rst_value, required this.rst_cd, required this.rst_nm});

  factory RstResponse.fromJson(Map<String, dynamic> json) => RstResponse(
      rst_value: json['RST_VALUE'] == null ? 'null' : 'null',
      rst_cd: json['RST_CD'] == null ? 0 : 0,
      rst_nm: json['RST_NM'] == null ? 'null' : 'null'
  );
}