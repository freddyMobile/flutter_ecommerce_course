import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_course/views/screens/single_product_screen.dart';
import 'package:flutter_ecommerce_course/views/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * 0.6,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(left: size.width * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Fashion\nSale',
                            textScaleFactor: 1.1,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: size.height * 0.03,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFDB3022)),
                        alignment: Alignment.center,
                        child: const Text(
                          'Check',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              background: Image.asset(
                'assets/images/poster.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sale',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 34,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Super summer sale',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 11,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const SingleProductScreen();
                          },
                        ));
                      },
                      child: ProductWidget(color: Colors.green)),
                  ProductWidget(color: Colors.red),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sale',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 34,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Super summer sale',
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 11,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                ProductWidget(color: Colors.green),
                ProductWidget(color: Colors.red),
                ProductWidget(color: Colors.amber),
                ProductWidget(color: Colors.black),
              ]),
            )
          ])),
        ],
      ),
    );
  }
}
