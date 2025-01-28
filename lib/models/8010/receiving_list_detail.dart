class ReceivingListDetail {
  final int dtl_seq;
  final String rcv_status_nm;
  final String item_cd;
  final String item_nm;
  final String item_unit;
  final String item_mng_unit_nm;
  final String vld_mng_type_nm;
  final int vld_day;
  final double ord_qty;
  final double rcv_qty;
  final double insp_qty;
  final String keep_loc;


  ReceivingListDetail({
    required this.dtl_seq,
    required this.rcv_status_nm,
    required this.item_cd,
    required this.item_nm,
    required this.item_unit,
    required this.item_mng_unit_nm,
    required this.vld_mng_type_nm,
    required this.vld_day,
    required this.ord_qty,
    required this.rcv_qty,
    required this.insp_qty,
    required this.keep_loc,
  });

  factory ReceivingListDetail.fromJson(Map<String, dynamic> json) => ReceivingListDetail(
    dtl_seq: json['DTL_SEQ'],
    rcv_status_nm: json['RCV_STATUS_NM'],
    item_cd: json['ITEM_CD'],
    item_nm: json['ITEM_NM'],
    item_unit: json['ITEM_UNIT'] == null ? '' : json['ITEM_UNIT'],
    item_mng_unit_nm: json['ITEM_MNG_UNIT_NM'],
    vld_mng_type_nm: json['VLD_MNG_TYPE_NM'],
    vld_day: json['VLD_DAY'],
    ord_qty: json['ORD_QTY'],
    rcv_qty: json['RCV_QTY'],
    insp_qty: json['INSP_QTY'],
    keep_loc: json['KEEP_LOC'],
  );
}