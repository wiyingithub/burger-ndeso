import 'package:flutter/material.dart';
import 'package:foodsapp/models/menu.dart';
import 'package:foodsapp/theme.dart';
import 'package:foodsapp/widgets/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Burgerian',
                style: poppinsTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                'Selamat Datang di Burger Ndeso',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: greyColor,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                'Recomended Menu',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 22),
              MenuCard(
                Menu(
                  id: 1,
                  image: 'assets/pic1.png',
                  name: 'Burger Regular',
                  price: 28000,
                  pricePromo: 22000,
                  note:
                      'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
                  isPromo: true,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard(
                Menu(
                  id: 2,
                  image: 'assets/pic2.png',
                  name: 'Burger Paket 1',
                  price: 28000,
                  pricePromo: 22000,
                  note:
                      'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard(
                Menu(
                  id: 3,
                  image: 'assets/pic3.png',
                  name: 'Burger Paket 2',
                  price: 25000,
                  pricePromo: 18000,
                  note:
                      'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
              MenuCard(
                Menu(
                  id: 4,
                  image: 'assets/pic4.png',
                  name: 'Burger Paket 3',
                  price: 22000,
                  pricePromo: 16000,
                  note:
                      'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
                  isPromo: false,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
