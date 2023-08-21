import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  Color color;
  ProductWidget({super.key, required this.color});

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
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image 2.png'))),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFDB3022)),
                    alignment: Alignment.center,
                    child: const Text(
                      '-20%',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: -10,
                  right: -10,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage('assets/images/star.png'))),
                Text(
                  '(10)',
                  style: TextStyle(
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
              children: const [
                Text(
                  'Dorothy Perkins',
                  style: TextStyle(
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
              children: const [
                Text(
                  'Evening Dress',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Row(
              children: const [
                Text(
                  '15\$',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFF9B9B9B),
                    fontSize: 14,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '12\$',
                  style: TextStyle(
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
