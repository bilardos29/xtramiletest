import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/models/movie_model.dart';
import 'package:xtramilemobiletest/models/review_model.dart';
import '../../utils/api.dart';

class DetailMovieController extends ChangeNotifier {
  MovieModel model = MovieModel();
  List<dynamic> listReview = [];

  void getDetailMovie(
      {int movieId = 0, required VoidCallback onSuccess}) async {
    var qString = {
      "language": 'en-US',
    };
    var api = Api(path: "$movieId", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      model = MovieModel.fromJson(response);
      notifyListeners();
      onSuccess();
    });
  }

  void getListReview(
      {int page = 1, int movieId = 0, required VoidCallback onSuccess}) async {
    var qString = {
      "language": 'en-US',
      "page": '$page',
    };
    var api = Api(path: '$movieId/reviews', queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      listReview = List.from(response["results"]);
      // ResponseListModel data = ResponseListModel.fromJson(response);
      // listMovieNowPlaying = List.from(data.result);
      notifyListeners();
      onSuccess();
    });
  }

  ReviewModel getReviewModel(dynamic val){
    return ReviewModel.fromJson(val);
  }
}
