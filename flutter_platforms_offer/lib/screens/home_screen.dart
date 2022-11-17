import 'package:flutter/material.dart';
import 'package:platforms-offer/screens/themes.dart';
import 'package:platforms-offer/widgets/menu_%20card.dart';
import 'package:platforms-offer/models/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Добредојде',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Подвижни терени',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Препорачана понуда за платформите',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                    ),
                  ),
                  MenuCard(
                    menu: Menu(
                        id: 1,
                        image: '../assets/pictures/tennis-court-grass.jpg',
                        name: 'Терени: тенис',
                        hours: 2,
                        pricePromo: 500,
                        note:
                            'Терените се вртат(искачуваат и слегнуваат по избор)',
                        isPromo: true),
                  ),
                  MenuCard(
                    menu: Menu(
                        id: 1,
                        image: '../assets/pictures/deep_pool.jpg',
                        name: 'Пливање',
                        hours: 1,
                        pricePromo: 700,
                        note:
                            'Базенот е на најдолното ниво и потребно е повлекување на првите слоеви со што се доплаќа 50 ден. За секое негово користење добивате 10 поени',
                        isPromo: false),
                  ),
                  MenuCard(
                    menu: Menu(
                        id: 1,
                        image: '../assets/pictures/football-field-soccer-background.jpg',
                        name: 'Фудбал',
                        hours: 2,
                        pricePromo: 1000,
                        note:
                            'Фудбалскиот терен е со различна должина и е опремен со најсовремена технологија (сензори на головите и слично)',
                        isPromo: true),
                  ),
                  MenuCard(
                    menu: Menu(
                        id: 1,
                        image: '../assets/pictures/basketball_court.jpg',
                        name: 'Кошарка',
                        hours: 1,
                        pricePromo: 850,
                        note:
                            'Теренот за кошарка е изграден со модерна подлога, која што одговара на најсовремените стандарди',
                        isPromo: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
