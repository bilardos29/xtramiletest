import 'package:flutter/cupertino.dart';
import 'package:xtramilemobiletest/utils/api.dart';

import '../../models/movie_model.dart';
import '../../models/response_model.dart';

class HomeController extends ChangeNotifier {
  late List<dynamic> listMovieUpcoming = [];
  late List<dynamic> listMovieNowPlaying = [];

  void getListMovieUpcoming() async {
    var qString = {
      "language": 'en-US',
      "page": '1',
    };
    var api = Api(path: "upcoming", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      ResponseListModel data = ResponseListModel.fromJson(response);
      listMovieUpcoming = List.from(data.result);
      notifyListeners();
    });
  }

  void getListMovieNowPlaying({int page = 1}) async {
    var qString = {
      "language": 'en-US',
      "page": '$page',
    };
    var api = Api(path: "now_playing", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      ResponseListModel data = ResponseListModel.fromJson(response);
      listMovieNowPlaying = List.from(data.result);
      notifyListeners();
    });
  }

  MovieModel converDataModel(dynamic data){
    return MovieModel.fromJson(data);
  }
}
