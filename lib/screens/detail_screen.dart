import 'package:flutter/material.dart';
import 'package:foodsapp/models/size.dart';
import 'package:foodsapp/theme.dart';
import 'package:foodsapp/widgets/size_card.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  launchUrl(String url) async {
    launch(url);
  }

  int i = 1;

  int dataPrice = 28000;
  int dataPricePromo = 22000;

  int price = 28000;
  int pricePromo = 22000;

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
              'assets/thumbnail.png',
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
                const SizedBox(height: 244),
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
                              'assets/promo.png',
                              width: 60,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Burger Regular ',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _minus,
                                  child: Image.asset(
                                    'assets/minus.png',
                                    width: 34,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '$i',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: _plus,
                                  child: Image.asset(
                                    'assets/plus.png',
                                    width: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(price),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: greyColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(pricePromo),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: yellowColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Pilih Ukuran',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
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
                                      name: 'Mini',
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
                                      name: 'Sedang',
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
                                      name: 'Besar',
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
                                      name: 'Super Besar',
                                      isActive: isSuperBesar,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Catatan Penjual',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: greyColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Lokasi Burger Ndeso',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    'https://goo.gl/maps/uG5sLXS8jyik3wDq5');
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/store.png',
                                    width: 50,
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    'JL Kalikajar 28\nWonosobo Jawa Tengah',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: greyColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: greyColor,
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
                                onPressed: () {
                                  launchUrl(
                                      'https://wa.me/088980039199?text=Saya%20beli%20burger%20$i%20(Rp%20$pricePromo)');
                                },
                                color: yellowColor,
                                child: Text(
                                  'Beli',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
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
