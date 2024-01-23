// class MovieDummy {
//   final String imageUrl;
//   final String title;
//   final String genre;
//   final String isShowing;
//   final String date;

//   MovieDummy({
//     required this.imageUrl,
//     required this.title,
//     required this.genre,
//     required this.isShowing,
//     required this.date,
//   });
// }

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

// MovieDummy dummyMovie = MovieDummy(
//   imageUrl: 'assets/example.png',
//   title: '범죄도시',
//   genre: '액션',
//   isShowing: "상영중",
//   date: '2020.10.20~',
// );

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
