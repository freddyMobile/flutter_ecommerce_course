import 'package:flutter/material.dart';

class CustomBagCard extends StatelessWidget {
  const CustomBagCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          child: Image.asset(
            'assets/images/1.jpg',
            width: 105,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(11),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pullover',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Color:',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.02,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Black',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.02,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Size:',
                                  style: TextStyle(
                                    color: Color(0xFF9B9B9B),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'L',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  MenuAnchor(
                    style: MenuStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          return Colors.white; // Use the component's default.
                        },
                      ),
                      padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.all(12),
                      ),
                    ),
                    builder: (BuildContext context, MenuController controller,
                        Widget? child) {
                      return SizedBox(
                        width: 30,
                        child: IconButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          color: Colors.black.withOpacity(0.25),
                          icon: const Icon(Icons.more_vert),
                        ),
                      );
                    },
                    menuChildren: [
                      Text(
                        'Add to favorites',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Delete from the list',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '51\$',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
