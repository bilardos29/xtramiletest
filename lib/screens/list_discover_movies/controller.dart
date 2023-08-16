import 'package:flutter/cupertino.dart';

import '../../models/response_model.dart';
import '../../utils/api.dart';

class DiscoverController extends ChangeNotifier {
  int page = 1;
  List<dynamic> listDiscover = [];

  void getListMovieDiscover() async {
    var qString = {
      "language": 'en-US',
      "page": '$page',
    };
    var api = Api(path: "discover/movie", queryString: qString);

    api.request(onError: (val) {
      print(val);
    }, onSuccess: (response) async {
      ResponseListModel data = ResponseListModel.fromJson(response);
      listDiscover.addAll(List.from(data.result));
      notifyListeners();
    });
  }

  void incrementPage() {
    page++;
    notifyListeners();
  }
}
