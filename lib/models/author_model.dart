class AuthorModel {
  String? name;
  String? username;
  String? avatarPath;
  double? rating;

  AuthorModel({this.name, this.username, this.avatarPath, this.rating});

  AuthorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'] != null
        ? 'https://image.tmdb.org/t/p/w500${json['avatar_path']}'
        : "";
    rating =
        json['rating'] != null ? double.parse(json['rating'].toString()) : 0.0;
  }
}
