import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // başlık
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 32,
                          color: Color(0XFF0A1034),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // banner
                  buildBanner(),
                  // butonlar
                  Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavigation(text: 'Categories', icon: Icons.menu),
                        buildNavigation(
                            text: 'Favorites', icon: Icons.star_border),
                        buildNavigation(
                            text: 'Gifts', icon: Icons.card_giftcard),
                        buildNavigation(
                            text: 'Best Selling', icon: Icons.people),
                      ],
                    ),
                  ),
                  // sales title
                  SizedBox(height: 40.0),
                  Container(
                    child: Center(
                      child: Text(
                        'Sales',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF0A1034)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // sales item
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          text: 'Smartphones',
                          photoUrl: 'assets/images/galaxy.png',
                          discount: '-50%',
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: 'Monitors',
                          photoUrl: 'assets/images/monitors.png',
                          discount: '-50%',
                          screenWidth: screenWidth),
                    ],
                  ),
                ],
              ),
            ),
            //bottom navigation bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, -3),
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10)
                  ],
                  color: Color(0XFFEFF5FB),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavIcon(icondata: Icons.home_filled, active: true),
                    buildNavIcon(icondata: Icons.search, active: false),
                    buildNavIcon(
                        icondata: Icons.shopping_basket, active: false),
                    buildNavIcon(icondata: Icons.person, active: false)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildNavIcon({required IconData icondata, required bool active}) {
  return Icon(icondata,
      size: 20, color: Color(active ? 0XFF0001FC : 0XFF0A1034));
}

Widget buildBanner() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Container(
        decoration: BoxDecoration(
            color: Color(0XFF0001FC), borderRadius: BorderRadius.circular(6)),
        child: Container(
          padding: EdgeInsets.only(right: 36, left: 24, top: 14, bottom: 18),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bose Home Speaker',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Column(
                  children: [
                    Text(
                      'USD 279',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/BoseHomeSpeaker.png',
                  height: 100,
                  width: 100,
                ),
              ],
            )
          ]),
        )),
  );
}

Widget buildNavigation({
  required String text,
  required IconData icon,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 22.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0XFFE0ECF8)),
        child: Icon(
          icon,
          color: Color(0XFF0001FC),
          size: 18,
        ),
      ),
      SizedBox(height: 8),
      Text(
        text,
        style: TextStyle(
            color: Color(0XFF1F53E4),
            fontSize: 14,
            fontWeight: FontWeight.w500),
      )
    ],
  );
}

Widget buildSalesItem(
    {required String text,
    required String photoUrl,
    required String discount,
    required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: Color(0XFFE0ECF)),
          child: Text(
            discount,
            style: TextStyle(color: Color(0XFF1F53E4), fontSize: 12),
          ),
        ),
        SizedBox(height: 22),
        Image.asset(
          photoUrl,
          height: 150.0,
        ),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Color(0XFF0A1034)),
          ),
        ),
      ],
    ),
  );
}
