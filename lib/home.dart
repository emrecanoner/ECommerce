import 'package:e_commerce_one/categories.dart';
import 'package:e_commerce_one/components/botttomNavigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
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
              child: ListView(children: [
                //Başlık

                buildHeader(),

                //Banner
                buildBanner(),

                //Butonlar
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildNavigation(
                        text: "Categories",
                        icon: Icons.menu,
                        context: context,
                        widget: CategoriesPage(),
                      ),
                      buildNavigation(
                        text: "Favorities",
                        icon: Icons.favorite,
                        context: context,
                        widget: buildBanner(),
                      ),
                      buildNavigation(
                        text: "Gifts",
                        icon: Icons.card_giftcard,
                        context: context,
                        widget: buildBanner(),
                      ),
                      buildNavigation(
                        text: "Best Selling",
                        icon: Icons.person,
                        context: context,
                        widget: buildBanner(),
                      ),
                    ],
                  ),
                ),

                //Sales
                SizedBox(height: 30),
                Text("Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034))),
                SizedBox(height: 8),

                //Sales items
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  buildSalesItems(
                      text: "SmartPhones",
                      photoUrl: "assets/images/smartphone8.png",
                      discount: "-50%",
                      screenWidth: screenWidth),
                  buildSalesItems(
                      text: "Tablets",
                      photoUrl: "assets/images/Tablet1.png",
                      discount: "-25%",
                      screenWidth: screenWidth)
                ]),
                SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  buildSalesItems(
                      text: "Monitors",
                      photoUrl: "assets/images/monitor.png",
                      discount: "-40%",
                      screenWidth: screenWidth),
                  buildSalesItems(
                      text: "Earphones",
                      photoUrl: "assets/images/earphone1.png",
                      discount: "-10%",
                      screenWidth: screenWidth)
                ]),
                SizedBox(height: 65),
              ]),
            ),

            //Buttom navigation bar
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text("Home",
        style: TextStyle(
            fontSize: 32,
            color: Color(0xFF0A1034),
            fontWeight: FontWeight.bold)),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 16.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bose Home Speaker",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 14),
            Text(
              "USD 279",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Image.asset("assets/images/speaker5.png")
      ]),
    ),
  );
}

Widget buildNavigation({
  required String text,
  required IconData icon,
  required Widget widget,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(text,
            style: TextStyle(
                color: Color(0xFF1F53E4),
                fontSize: 14,
                fontWeight: FontWeight.w500))
      ],
    ),
  );
}

Widget buildSalesItems({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenWidth,
}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //%50
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2), color: Color(0xFFE0ECF8)),
          child: Text(
            discount,
            style: TextStyle(color: Color(0xFF1F53E4), fontSize: 12),
          ),
        ),
        SizedBox(height: 10),

        //Telefon resmi
        Image.asset(photoUrl),

        SizedBox(height: 5),

        //İsmi
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        )
      ],
    ),
  );
}
