class MovieDummy {
  final String imageUrl;
  final String title;
  final String genre;
  final String isShowing;
  final String date;

  MovieDummy({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.isShowing,
    required this.date,
  });
}

List<MovieDummy> dummyMovies = [
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  MovieDummy(
    imageUrl: 'assets/example.png',
    title: '범죄도시',
    genre: '액션',
    isShowing: "상영중",
    date: '2020.10.20~',
  ),
  // 여기에 더 많은 무비를 추가할 수 있습니다.
];
