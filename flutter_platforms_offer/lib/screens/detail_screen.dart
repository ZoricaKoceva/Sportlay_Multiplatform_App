import 'package:flutter/material.dart';
import 'package:platforms-offer/models/size.dart';
import 'package:platforms-offer/screens/themes.dart';
import 'package:platforms-offer/widgets/size_card.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  int i = 1;

  int dataPrice = 300;
  int dataPricePromo = 250;

  int price = 1500;
  int pricePromo = 1000;

  bool isMini = true;
  bool isSedang = false;
  bool isBesar = false;
  bool isSuperBesar = false;

  void _minus() {
    setState(() {
      if (i > 1) {
        i--;
        if (isMini == true) {
          price = dataPrice * i;
          pricePromo = dataPricePromo * i;
        } else if (isSedang == true) {
          price = (dataPrice + 2000) * i;
          pricePromo = (dataPricePromo + 2000) * i;
        } else if (isBesar == true) {
          price = (dataPrice + 4000) * i;
          pricePromo = (dataPricePromo + 4000) * i;
        } else if (isSuperBesar == true) {
          price = (dataPrice + 6000) * i;
          pricePromo = (dataPricePromo + 6000) * i;
        }
      }
    });
  }

  void _plus() {
    setState(() {
      i++;

      if (isMini == true) {
        price = dataPrice * i;
        pricePromo = dataPricePromo * i;
      } else if (isSedang == true) {
        price = (dataPrice + 2000) * i;
        pricePromo = (dataPricePromo + 2000) * i;
      } else if (isBesar == true) {
        price = (dataPrice + 4000) * i;
        pricePromo = (dataPricePromo + 4000) * i;
      } else if (isSuperBesar == true) {
        price = (dataPrice + 6000) * i;
        pricePromo = (dataPricePromo + 6000) * i;
      }
    });
  }

  void _clickMini() {
    setState(() {
      price = dataPrice * i;
      pricePromo = dataPricePromo * i;

      isMini = true;
      isSedang = false;
      isBesar = false;
      isSuperBesar = false;
    });
  }

  void _clickSedang() {
    setState(() {
      price = (dataPrice + 2000) * i;
      pricePromo = (dataPricePromo + 2000) * i;
      isMini = false;
      isSedang = true;
      isBesar = false;
      isSuperBesar = false;
    });
  }

  void _clickBesar() {
    setState(() {
      price = (dataPrice + 4000) * i;
      pricePromo = (dataPricePromo + 4000) * i;
      isMini = false;
      isSedang = false;
      isBesar = true;
      isSuperBesar = false;
    });
  }

  void _clickSuperBesar() {
    setState(() {
      price = (dataPrice + 6000) * i;
      pricePromo = (dataPricePromo + 6000) * i;
      isMini = false;
      isSedang = false;
      isBesar = false;
      isSuperBesar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              '../assets/pictures/tennis-court-grass.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/btn_back.png', width: 40),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/btn_share.png', width: 40),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                const SizedBox(height: 264),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/Promo.png',
                              width: 60,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Тениски терен трева',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _minus,
                                  child: Image.asset(
                                    'assets/Minus.png',
                                    width: 34,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '$i',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackColor,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: _plus,
                                  child: Image.asset(
                                    'assets/Plus.png',
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  'Цена 500 ден.',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    color: kGreyColor,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '$price',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    color: kYellowColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Зорица Коцева',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _clickMini,
                                  child: SizeCard(
                                    Size(
                                      id: 1,
                                      name: 'На мало',
                                      isActive: isMini,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: _clickSedang,
                                  child: SizeCard(
                                    Size(
                                      id: 2,
                                      name: 'Цел',
                                      isActive: isSedang,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: _clickBesar,
                                  child: SizeCard(
                                    Size(
                                      id: 3,
                                      name: 'Полу тренинг терен',
                                      isActive: isBesar,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                InkWell(
                                  onTap: _clickSuperBesar,
                                  child: SizeCard(
                                    Size(
                                      id: 4,
                                      name: 'Целосен со рефлектори',
                                      isActive: isSuperBesar,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Тениски терен',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Тениски терен на трева, се менуваат и на бетон и земја',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: kGreyColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Понудата е за тековниот месец',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/Img_store.png',
                                    width: 50,
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    'Резервирај\nЗакажи го и изнајми',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: kGreyColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: kGreyColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                                focusElevation: 0,
                                hoverElevation: 0,
                                disabledElevation: 0,
                                highlightElevation: 0,
                                onPressed: () {},
                                color: kYellowColor,
                                child: Text(
                                  'Закажи',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
