import 'package:dio/dio.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';

class APIConnectionUtil {
  final _url = 'https://test.komunal.id/robo-test/';
  final Dio _dio = Dio();

  Future<void> getData({required MovieModel movieModel}) async {
    try {
      Response response = await _dio.put(
        _url,
        data: movieModel.toJson(),
      );

      print('check response: ${response.data}');
    } catch (e) {
      print('Error connection: $e');
    }
  }
}
