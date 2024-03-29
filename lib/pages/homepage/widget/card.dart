import 'package:flutter/material.dart';
import 'package:z_learning/utils/themes.dart';

class CardCourse extends StatelessWidget {
  final String title;
  final String pengajar;
  final String price;
  final String image;

  CardCourse(
      {required this.title,
      required this.pengajar,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: tsBodySmallMediumBlack,
                    ),
                    SizedBox(height: 5),
                    Text(
                      pengajar,
                      style: tsLabelRegularBlack,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "\$" + price,
                      style: tsBodySmallMediumBlack,
                    ),
                  ]),
            )
          ],
        ));
  }
}
