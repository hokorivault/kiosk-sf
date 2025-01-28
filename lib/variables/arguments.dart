class Arguments {
  late int no;
  late String rcv_dt;
  late int rcv_seq;
  late String recv_no;
  late String recv_status;
  late String acct_code;
  late String acct_name;
  late int item_cnt;

  Arguments({
    required this.no,
    required this.rcv_dt,
    required this.rcv_seq,
    required this.recv_no,
    required this.recv_status,
    required this.acct_code,
    required this.acct_name,
    required this.item_cnt,
  });
}