class ReceivingList {
  final String rcv_dt;
  final int rcv_seq;
  final String rcv_no;
  final String rcv_status_nm;
  final String cust_cd;
  final String cust_nm;
  final int item_cnt;
  final String rcv_type_nm;
  final String remark;

  ReceivingList({
    required this.rcv_dt,
    required this.rcv_seq,
    required this.rcv_no,
    required this.rcv_status_nm,
    required this.cust_cd,
    required this.cust_nm,
    required this.rcv_type_nm,
    required this.item_cnt,
    required this.remark
  });

  factory ReceivingList.fromJson(Map<String, dynamic> json) => ReceivingList(
      rcv_dt: json['RCV_DT'],
      rcv_seq: json['RCV_SEQ'],
      rcv_no: json['RCV_NO'],
      rcv_status_nm: json['RCV_STATUS_NM'],
      cust_cd: json['CUST_CD'],
      cust_nm: json['CUST_NM'],
      rcv_type_nm: json['RCV_TYPE_NM'],
      item_cnt: json['ITEM_CNT'] == null ? 1 : 1,
      remark: json['REMARK']
  );
}