import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_learning/database/database.dart';
import 'package:z_learning/service/learning_controller.dart';
import 'package:z_learning/service/learning_model.dart';
import 'package:z_learning/utils/themes.dart';

class DetailCard extends StatelessWidget {
  final LearningController learningController = Get.put(LearningController());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Learning learn = data;
    final bool isFavorite = learningController.isCourseFavorite(learn);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Detail Course",
          style: tsBodyMediumSemiboldBlack,
        ),
      ),
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
                onPressed: () {
                  toggleFavorite(learn, isFavorite);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                  color: isFavorite
                      ? Colors.red
                      : null, 
                ))
          ],
        ),
      ),
    );
  }

  void toggleFavorite(Learning learn, bool isCurrentlyFavorite) {
    if (isCurrentlyFavorite) {
      learningController.removeFromFavorites(learn);
      DatabaseHelper().deleteFavorite(learn.id);
    } else {
      learningController.addToFavorites(learn);
      DatabaseHelper().insertFavorite(learn);
    }
    learningController.update();
  }
}
