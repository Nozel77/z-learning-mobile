import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_learning/service/learning_controller.dart';
import 'package:z_learning/service/learning_model.dart';
import 'package:z_learning/utils/themes.dart';

class DetailCard extends StatelessWidget {
  final LearningController learningController = Get.put(LearningController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Learning learn = data;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(learn.images),
              height: 250,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              learn.title,
              style: tsBodyLargeSemiboldBlack,
            ),
            SizedBox(height: 10),
            Text(
              learn.description,
              style: tsBodySmallMediumBlack,
            ),
            SizedBox(height: 10),
            Text(
              "instructor : " + learn.instructor,
              style: tsBodySmallMediumBlack,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "\$" + learn.price.toString(),
                  style: tsBodySmallMediumBlack,
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage("assets/star.jpg"),
                  height: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  learn.rating.toString(),
                  style: tsBodySmallMediumBlack,
                ),
              ],
            ),
            SizedBox(height: 20),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_outline_outlined))
          ],
        ),
      ),
    );
  }
}
