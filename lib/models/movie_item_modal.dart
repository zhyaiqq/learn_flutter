int counter = 0;

class MovieItem {
  int rank;
  String title;
  String originalTitle;
  String imgUrl;
  String playDate;
  double rating;
  List<String> genres;
  Director director;
  List<Actor> actors;

  MovieItem.fromMap(Map<String,  dynamic> json) {
    print(json['rating']['average']);
    this.rank = ++counter;
    this.title = json['title'];
    this.originalTitle = json['original_title'];
    this.imgUrl = json['images']['medium'];
    this.playDate = json['year'];
    this.rating = json['rating']['average'];
    this.genres = json['genres'].cast<String>();
    this.director = Director.fromMap(json['directors'][0]);
    this.actors = (json['casts'] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
  }
}


class Person {
  String name;
  String avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json['name'];
    this.avatarURL = json['avatars']['medium'];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
}