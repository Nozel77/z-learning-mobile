import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:z_learning/service/learning_model.dart';

class LearningController extends GetxController {
  var learningResponseModel = <Learning>[].obs;
  var apiUrl = 'https://zell-learning.000webhostapp.com/api/learning';

  @override
  void onInit() {
    getDataLearning();
    super.onInit();
  }

  Future<void> getDataLearning () async {
    
    try {
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response = await dioInstance.get(apiUrl);

      if ( response.statusCode == 200 ) {
        final List<dynamic> LearningList = response.data["data"];      
        learningResponseModel.value = LearningList.map((json) => Learning.fromJson(json)).toList();
      } else {
        print("Failed to fetch learning. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching learning: $error");
    }
  }
}