import 'dart:convert';

class NewsModel {
  String? title;
  String? url;
  String? urlToImage;
  String? name;
  NewsModel({
    this.title,
    this.url,
    this.urlToImage,
    this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(title != null){
      result.addAll({'title': title});
    }
    if(url != null){
      result.addAll({'url': url});
    }
    if(urlToImage != null){
      result.addAll({'urlToImage': urlToImage});
    }
    if(name != null){
      result.addAll({'name': name});
    }
  
    return result;
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) => NewsModel.fromMap(json.decode(source));
}
