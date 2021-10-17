import 'dart:ui';

import 'package:moorpay/constants/colors_constant.dart';

class CreditCard {
  const CreditCard({
    this.cardNumber = '',
    this.cardType = '',
    this.cardTop = '',
    this.cardBottom = '',
    this.cardBackground = kPrimaryColor,
    this.user = '',
    this.expiryDate = '',
  });

  final String cardNumber;
  final String cardType;
  final String user;
  final String cardTop;
  final String cardBottom;
  final Color cardBackground;
  final String expiryDate;
}

List cards = <CreditCard>[
  CreditCard(
    cardNumber: '**** **** **** 1542',
    user: 'Amanda Alex',
    cardType: 'mastercard',
    expiryDate: '07-02-2022',
  ),
  CreditCard(
    cardNumber: '**** **** **** 5683', 
    user: 'Amanda Alex', 
    cardType: 'visa',
    expiryDate: '03-01-2023',
  ),
  CreditCard(
    cardNumber: '**** **** **** 0093',
    user: 'Amanda Alex',
    cardType: 'mastercard',
    expiryDate: '08-01-2023',
  ),
];
