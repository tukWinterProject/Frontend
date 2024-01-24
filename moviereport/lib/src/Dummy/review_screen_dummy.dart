class MovieDummy {
  final int? id;
  final int? user_id;
  final String? title;
  final int? showing;
  final String? genre;
  final String? release_date;
  final String? end_date;
  // final String registration_date;
  final String? image_url;

  MovieDummy({
    required this.id,
    required this.user_id,
    required this.title,
    required this.showing,
    required this.genre,
    required this.release_date,
    required this.end_date,
    // required this.registration_date,
    required this.image_url,
  });
}

class ReviewsDummy {
  final String name;
  final String content;
  final String created_at;

  ReviewsDummy({
    required this.name,
    required this.content,
    required this.created_at,
  });
}

List<ReviewsDummy> dummyReviws = [
  ReviewsDummy(
      name: "김하은", created_at: "2024.01.19.13:16", content: "주인공이 귀여워요"),
  ReviewsDummy(
      name: "김하은", created_at: "2024.01.19.13:16", content: "주인공이 귀여워요"),
  ReviewsDummy(
      name: "김하은", created_at: "2024.01.19.13:16", content: "주인공이 귀여워요"),
  ReviewsDummy(
      name: "김하은", created_at: "2024.01.19.13:16", content: "주인공이 귀여워요"),
];
