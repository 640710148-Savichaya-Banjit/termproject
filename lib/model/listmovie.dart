class ListMovie {
  final int? id;
  final String? name;
  final String? year;
  final String? synopsis;
  final String? Lengthofmovie;
  final String? review;
  final String? image;
  final String? director;
  final String? actor;

  ListMovie(
      {required this.id,
      required this.name,
      required this.year,
      required this.synopsis,
      required this.Lengthofmovie,
      required this.review,
      required this.image,
      required this.director,
      required this.actor});

  factory ListMovie.fromJson(Map<String, dynamic> json) {
    return ListMovie(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      synopsis: json['synopsis'],
      Lengthofmovie: json['Lengthofmovie'],
      review: json['review'],
      image: json['image'],
      director: json['director'],
      actor: json['actor'],
    );
  }
}
