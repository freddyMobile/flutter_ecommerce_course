// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListTileProductWidget extends StatelessWidget {
  final String imageUrl;
  final String discountPercentage;
  final String rating;
  final String brand;
  final String description;
  final String price;
  const ListTileProductWidget({
    Key? key,
    required this.imageUrl,
    required this.discountPercentage,
    required this.rating,
    required this.brand,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: 150,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  brand,
                  style: const TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 11,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 260,
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${(double.parse(price) * 100 / double.parse(discountPercentage)).toStringAsFixed(1)}\$',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xFF9B9B9B),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                        height: 1.43,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$price\$',
                      style: const TextStyle(
                        color: Color(0xFFDB3022),
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w500,
                        height: 1.43,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            Image(image: AssetImage('assets/images/star.png'))),
                    const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            Image(image: AssetImage('assets/images/star.png'))),
                    const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            Image(image: AssetImage('assets/images/star.png'))),
                    const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            Image(image: AssetImage('assets/images/star.png'))),
                    const SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            Image(image: AssetImage('assets/images/star.png'))),
                    Text(
                      '($rating)',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9B9B9B)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
