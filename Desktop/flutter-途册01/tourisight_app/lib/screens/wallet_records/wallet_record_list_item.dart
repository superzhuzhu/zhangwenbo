import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import '../../exports.dart';

class WalletRecordListItem extends StatelessWidget {
  final Bill bill;

  WalletRecordListItem(this.bill);

  @override
  Widget build(BuildContext context) {
    String friendlyAmount = '${bill.flow == 'expense' ? '-' : '+'}${bill.friendlyAmount}';

    return Container(
      child : new Material(
        color: Colors.white,
        child: new InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                bill.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff333333),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  bill.remark,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Container(height: 10,),
                              Text(
                                new DateFormat("yyyy-MM-dd HH:mm").format(new DateTime.fromMillisecondsSinceEpoch(bill.createdAt)),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff999999),
                                )
                              ),
                            ],
                          )
                        ),
                      ),
                      Container(
                        child: Text(
                          friendlyAmount,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: bill.flow == 'expense' ? Color(0xff333333) : Color(0xffE64B23),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
