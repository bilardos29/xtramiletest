class ResponseListModel {
  int? page;
  dynamic result;
  int? totalPages;
  int? totalResults;

  ResponseListModel({
    this.page,
    this.result,
    this.totalPages,
    this.totalResults,
  });

  ResponseListModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    result = json['results'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['results'] = result;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
