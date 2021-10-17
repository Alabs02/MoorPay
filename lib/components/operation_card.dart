import 'package:flutter/material.dart';
import 'package:moorpay/components/app_text.dart';
import 'package:moorpay/constants/colors_constant.dart';
import 'package:moorpay/constants/config_constant.dart';

class OperationCard extends StatelessWidget {
  final Size size;
  final bool isSelelected;
  final String title;
  final IconData icon;

  OperationCard({
    Key? key, 
    required this.size, 
    required this.isSelelected,
    required this.icon,
    required this.title,
    })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      height: size.height * 0.18,
      width: size.width * 0.35,
      margin: EdgeInsets.only(
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: (isSelelected) ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: kTenBlackColor.withOpacity(0.25),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: (isSelelected) ? Colors.white : kPrimaryColor,
            size: 40.0,
          ),
          SizedBox(height: kDefaultPadding / 2),
          AppText(
            copy: '$title',
            color: (isSelelected) ? Colors.white : kPrimaryColor,
            size: 14.0,
            weight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}