import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_learning/pages/homepage/widget/card.dart';
import 'package:z_learning/pages/homepage/widget/search_field.dart';
import 'package:z_learning/service/learning_controller.dart';
import 'package:z_learning/utils/themes.dart';

class Homepage extends StatelessWidget {
  final LearningController learningController = Get.put(LearningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  SearchFieldWidget(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mark_chat_unread_outlined),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/banner1.jpg"),
                        fit: BoxFit.cover),
                  )),
              SizedBox(height: 50),
              Text(
                "Popular Courses",
                style: tsBodyLargeSemiboldBlack,
              ),
              Obx(() => Container(
                padding: EdgeInsets.only(top: 20),
                child: GridView.builder(
                itemCount: learningController.learningResponseModel.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final learn = learningController.learningResponseModel[index];
                  print(learningController.learningResponseModel[index]);
                  return InkWell(
                    child: Container(
                      child: CardCourse(
                        title: learn.title,
                        pengajar: learn.instructor,
                        price: learn.price.toString(),
                        image: learn.images,
                      ),
                    ),
                  );
                },
              ),
              ))
              
            ],
          ),
        ),
      ),
    );
  }
}
