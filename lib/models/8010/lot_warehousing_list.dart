class LotWarehousingList {
  final int lot_seq;
  final String vld_dt;
  final String lot_no;
  final double rcv_qty;

  LotWarehousingList({
    required this.lot_seq,
    required this.vld_dt,
    required this.lot_no,
    required this.rcv_qty,
  });

  factory LotWarehousingList.fromJson(Map<String, dynamic> json) => LotWarehousingList(
    lot_seq: json['LOT_SEQ'],
    vld_dt: json['VLD_DT'],
    lot_no: json['LOT_NO'],
    rcv_qty: json['RCV_QTY'],
  );
}