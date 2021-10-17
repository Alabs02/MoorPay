import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Operation {
  Operation({this.icon = Icons.home, this.title = ''});

  String title;
  IconData icon;
}

List data = <Operation>[
  Operation(
    title: 'Money Transfer',
    icon: LineIcons.wallet,
  ),
  Operation(
    title: 'Bank Withdraw',
    icon: LineIcons.piggyBank,
  ),
  Operation(
    title: 'Pay Bills',
    icon: LineIcons.wavyMoneyBill,
  ),
];
