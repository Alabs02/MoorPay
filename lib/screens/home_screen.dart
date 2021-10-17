import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:heroicons/heroicons.dart';
import 'package:moorpay/components/app_text.dart';
import 'package:moorpay/components/operation_card.dart';
import 'package:moorpay/constants/colors_constant.dart';
import 'package:moorpay/constants/config_constant.dart';
import 'package:moorpay/models/card_model.dart';
import 'package:moorpay/models/operation_model.dart';
import 'package:moorpay/models/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  // Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String truncateText(String copy) {
    if (copy.length > 12) {
      return copy.replaceRange(10, copy.length, '...');
    } else {
      return copy;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom AppBar
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => {print('Clicked')},
                    borderRadius: BorderRadius.circular(20.0),
                    child: HeroIcon(
                      HeroIcons.menuAlt2,
                      size: 35.0,
                      color: kSecondaryColor,
                    ),
                  ),
                  Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFff81a4),
                        image: DecorationImage(
                          image: Svg('assets/svg/female_avatar.svg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding / 2),

            // Salutation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: kDefaultPadding / 2),
                  child: AppText(
                    copy: "Good Evening",
                    size: 16,
                    tracking: 0.0,
                    weight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: kDefaultPadding / 4),
                Padding(
                  padding: EdgeInsets.only(left: kDefaultPadding / 2),
                  child: AppText(
                    copy: "Amanda Alex",
                    size: 25,
                    weight: FontWeight.w700,
                    tracking: 0.8,
                  ),
                ),
              ],
            ),

            // Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(right: kDefaultPadding / 2),
              child: Flex(
                direction: Axis.horizontal,
                children: List.generate(cards.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding / 2,
                      top: kDefaultPadding / 2,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.88,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: -20.0,
                              left: -20.0,
                              child: CircleAvatar(
                                backgroundColor: kAccentColor,
                                radius: 40.0,
                              ),
                            ),
                            Positioned(
                              top: 28.0,
                              right: 20.0,
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                padding: EdgeInsets.all(kDefaultPadding / 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image(
                                    image: AssetImage(
                                        (cards[index].cardType == 'mastercard')
                                            ? 'assets/icons/mastercard.png'
                                            : 'assets/icons/visa_00.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              right: 0.0,
                              left: 0.0,
                              child: CircleAvatar(
                                backgroundColor: kAccentColor.withAlpha(10),
                                radius: 80.0,
                              ),
                            ),
                            Positioned(
                              bottom: -35.0,
                              right: -30.0,
                              child: CircleAvatar(
                                backgroundColor: kAccentColor,
                                radius: 80.0,
                              ),
                            ),
                            Positioned(
                              top: 25.0,
                              left: 20.0,
                              child: AppText(
                                copy: 'Card Number'.toUpperCase(),
                                size: 13.0,
                                color: Colors.white,
                                weight: FontWeight.w300,
                                tracking: 1.5,
                              ),
                            ),
                            Positioned(
                              top: 40.0,
                              left: 20.0,
                              child: AppText(
                                copy:
                                    '${cards[index].cardNumber}'.toUpperCase(),
                                size: 16.5,
                                color: Colors.white,
                                weight: FontWeight.w600,
                                tracking: 0.8,
                              ),
                            ),
                            Positioned(
                              bottom: 45.0,
                              left: 20.0,
                              child: AppText(
                                copy: 'Card HolderName'.toUpperCase(),
                                size: 13.0,
                                color: Colors.white,
                                weight: FontWeight.w300,
                                tracking: 1.5,
                              ),
                            ),
                            Positioned(
                              bottom: 25.0,
                              left: 20.0,
                              child: AppText(
                                copy: '${cards[index].user}',
                                size: 16.5,
                                color: Colors.white,
                                weight: FontWeight.w700,
                                tracking: 0.9,
                              ),
                            ),
                            Positioned(
                              bottom: 45.0,
                              left: 190.0,
                              child: AppText(
                                copy: 'Expiry Date'.toUpperCase(),
                                size: 13.0,
                                color: Colors.white,
                                weight: FontWeight.w300,
                                tracking: 1.5,
                              ),
                            ),
                            Positioned(
                              bottom: 25.0,
                              left: 190.0,
                              child: AppText(
                                copy: '${cards[index].expiryDate}',
                                size: 16.0,
                                color: Colors.white,
                                weight: FontWeight.w700,
                                tracking: 0.9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Operation Section
            Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
                top: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    copy: 'Operation',
                    size: 16,
                    weight: FontWeight.w700,
                  ),
                  Row(
                    children: map<Widget>(data, (index, selected) {
                      return Container(
                        height: 9,
                        width: 9,
                        margin: EdgeInsets.only(right: 6.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (current == index)
                              ? kPrimaryColor
                              : kLightPrimaryColor,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              child: Flex(
                direction: Axis.horizontal,
                children: List.generate(data.length, (index) {
                  return InkWell(
                    onTap: () => {setState(() => current = index)},
                    borderRadius: BorderRadius.circular(15.0),
                    child: OperationCard(
                      size: size,
                      title: data[index]?.title,
                      icon: data[index]?.icon,
                      isSelelected: (current == index) ? true : false,
                    ),
                  );
                }),
              ),
            ),

            // Transaction Section
            Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding / 2,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding / 2,
              ),
              child: AppText(
                copy: 'Transaction Histories',
                size: 16,
                weight: FontWeight.w700,
                tracking: 0.9,
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(transactions.length, (index) {
                  return Container(
                    width: size.width,
                    padding: EdgeInsets.all(kDefaultPadding),
                    margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: kBlackColor.withOpacity(0.15),
                            blurRadius: 10.0,
                            offset: Offset(2.0, 2.0),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              width: 50.0,
                              margin:
                                  EdgeInsets.only(right: kDefaultPadding / 2),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${transactions[index]?.brand}'),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                AppText(
                                  copy: truncateText(transactions[index].beneficiary),
                                  size: 18.0,
                                  weight: FontWeight.w700,
                                  tracking: 0.5,
                                ),
                                AppText(
                                  copy: '${transactions[index].transDate}',
                                  size: 14.0,
                                  weight: FontWeight.w400,
                                  tracking: 0.1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        AppText(
                          copy: '\$${transactions[index].amount}',
                          weight: FontWeight.w800,
                          color: kPrimaryColor,
                          size: 16.0,
                          tracking: 0.4,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
