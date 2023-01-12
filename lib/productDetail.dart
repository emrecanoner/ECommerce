import 'package:e_commerce_one/components/botttomNavigation.dart';
import 'package:e_commerce_one/components/header.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  ProductDetailPage(this.productTitle);
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color selectedColor = Color(0xFF52514F);
  int selectedCapacity = 64;
  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> capacities = [64, 256, 512];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  header(widget.productTitle, context),
                  SizedBox(height: 32),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView(
                        children: [
                          //New
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xFFE0ECF8)),
                            child: Text(
                              'New',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF1F53E4), fontSize: 12),
                            ),
                          ),
                          SizedBox(height: 25),
                          //Photo
                          Center(
                              child: Image.asset('assets/images/laptopc1.png')),
                          SizedBox(height: 30),
                          //Color
                          Text(
                            'Color',
                            style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colors
                                .map((Color color) => colorOption(
                                      color,
                                      selectedColor == color,
                                      () {
                                        setState(() {
                                          selectedColor = color;
                                        });
                                      },
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 32),
                          //Kapasite
                          Text(
                            'Capacity',
                            style: TextStyle(
                              color: Color(0xFF0A1034),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: capacities
                                .map((int number) => capacityOption(
                                        number, selectedCapacity == number, () {
                                      setState(() {
                                        selectedCapacity = number;
                                      });
                                    }))
                                .toList(),
                          ),
                          SizedBox(height: 32),
                          //Sepete Ekle
                          GestureDetector(
                            onTap: () {
                              print('Ürün Sepete Eklendi');
                              print('Ürünün İsmi: ' + widget.productTitle);
                              print('Ürünün Rengi: ' +
                                  selectedColor.value.toString());
                              print('Ürünün Kapasitesi: ' +
                                  selectedCapacity.toString() +
                                  ' gb');
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xFF1F53E4)),
                              child: Text(
                                'Add to Cart',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(height: 65),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar('search'),
          ],
        ),
      ),
    );
  }
}

Widget colorOption(Color color, bool selected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFF0001FC), width: selected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capacityOption(int capacity, bool selected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        '$capacity gb',
        style: TextStyle(
            color: Color(selected ? 0xFF0001FC : 0xFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
