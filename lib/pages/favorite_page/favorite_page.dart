import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_learning/pages/homepage/widget/card.dart';
import 'package:z_learning/service/learning_controller.dart';
import 'package:z_learning/service/learning_model.dart';
import 'package:z_learning/utils/themes.dart';

class FavoritePage extends StatelessWidget {
  final LearningController learningController = Get.find<LearningController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Favorite Course",
          style: tsBodyMediumSemiboldBlack,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 15),
        child: SingleChildScrollView(
          child: GetX<LearningController>(
            builder: (learningController) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: learningController.favorites.length,
                itemBuilder: (context, index) {
                  Learning favorite = learningController.favorites[index];
                  return GestureDetector(
                    onLongPress: () {
                      showConfirmationDialog(context, favorite);
                    },
                    child: CardCourse(
                      title: favorite.title,
                      pengajar: favorite.instructor,
                      price: favorite.price.toString(),
                      image: favorite.images,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context, Learning favorite) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus dari Favorit?'),
          content: Text('Apakah Anda yakin ingin menghapus kursus ini dari daftar favorit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                learningController.removeFromFavorites(favorite);
                Navigator.of(context).pop(); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
