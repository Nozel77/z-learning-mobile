import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:z_learning/database/database.dart';
import 'package:z_learning/service/learning_model.dart';

class LearningController extends GetxController {
  var learningResponseModel = <Learning>[].obs;
  var favorites = <Learning>[].obs;
  var apiUrl = 'https://zell-learning.000webhostapp.com/api/learning';

  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    getDataLearning();
    getFavoritesFromDb();
    super.onInit();
  }

  Future<void> getDataLearning() async {
    try {
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance.get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> LearningList = response.data["data"];
        learningResponseModel.value =
            LearningList.map((json) => Learning.fromJson(json)).toList();
      } else {
        print("Failed to fetch learning. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching learning: $error");
    }
  }

  Future<void> getFavoritesFromDb() async {
    favorites.value = await dbHelper.getFavorites();
  }

  void addToFavorites(Learning learn) {
    favorites.add(learn);
    update();
  }

  void removeFromFavorites(Learning learn) async {
    favorites.remove(learn);
    await dbHelper.deleteFavorite(learn.id);
    update();
  }

  bool isCourseFavorite(Learning learn) {
    return favorites.contains(learn);
  }
}
