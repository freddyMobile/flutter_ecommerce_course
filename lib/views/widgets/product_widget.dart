import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String imageUrl;
  VoidCallback onFavPressed;
  final String discountPercentage;
  final String rating;
  final String brand;
  final String description;
  final String price;
  final Widget favIcon;
  ProductWidget(
      {super.key,
      required this.imageUrl,
      required this.discountPercentage,
      required this.rating,
      required this.description,
      required this.brand,
      required this.price,
      required this.onFavPressed,
      required this.favIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 200,
        //height: 400,

        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imageUrl))),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFDB3022)),
                    alignment: Alignment.center,
                    child: Text(
                      '-$discountPercentage%',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: InkWell(
                    onTap: onFavPressed,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: favIcon,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                Text(
                  '($rating)',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF222222),
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '${(double.parse(price) - double.parse(price) * 100 / double.parse(discountPercentage)).toStringAsFixed(1)}\$',
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
          ],
        ),
      ),
    );
  }
}
