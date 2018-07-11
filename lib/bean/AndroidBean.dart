

class AndroidBean {


  bool error;
  List<AndroidList> results;
  AndroidBean.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        results = json['results'];

  Map<String, dynamic> toJson() =>
      {
        'error': error,
        'results': results,
      };

}

 class AndroidList{
  String url;

}