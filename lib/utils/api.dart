import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiMethod {
  static const GET = "GET";
  static const POST = "POST";
}

class Api {
  String apiMethod;

  dynamic path;
  dynamic headers;
  dynamic data;
  dynamic queryString;

  Api(
      {this.apiMethod = ApiMethod.GET,
      this.path,
      this.headers,
      this.data,
      this.queryString});

  Map<String, dynamic> get finalHeader {
    Map<String, dynamic> _finalHeader = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDYyMGM4OTY2OGIwYjljOTA3ZDMyN2RlYjgzYzlh'
              'ZiIsInN1YiI6IjY0ZDljZDVhMzcxMDk3MDEzOTQ1OGNlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.'
              '2EmisHSZpkVkrEiZYsLiOXoEU13tmPjO-vBrk5iabvk'
    };
    return headers == null ? _finalHeader : headers;
  }

  request(
      {VoidCallback? onTokenExpired,
      required ValueChanged<String> onError,
      required ValueChanged<dynamic> onSuccess}) async {
    try {
      var url = "https://api.themoviedb.org/3/movie/" + path;
      //print('url dio $url header $finalHeader, $apiMethod');
      var options = Options(
          responseType: ResponseType.json,
          headers: finalHeader,
          method: apiMethod);
      var response = await Dio()
          .request(url,
              options: options, data: data, queryParameters: queryString)
          .timeout(Duration(seconds: 20));
      onSuccess(response.data);
    } on DioError catch (error) {
      if (error.response == null) {
        onError("Terjadi kesalahan. Silahkan coba lagi");
        return;
      }

      print('err ${error.response}');
      onError(error.response.toString());
    } catch (e) {
      onError("Terjadi kesalahan. Silahkan coba lagi (2)");
    }
  }
}
