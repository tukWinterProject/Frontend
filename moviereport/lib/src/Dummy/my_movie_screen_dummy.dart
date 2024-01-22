class MyMovieListDummy {
  final int id;
  final int user_id;
  final String title;
  final int showing;
  final String genre;
  final String release_date;
  final String end_date;
  final String registration_date;
  final String image_url;

  MyMovieListDummy(
      {required this.id,
      required this.user_id,
      required this.title,
      required this.showing,
      required this.genre,
      required this.release_date,
      required this.end_date,
      required this.registration_date,
      required this.image_url});
}

List<MyMovieListDummy> dummyMyMoviesList = [
  MyMovieListDummy(
    id: 1,
    user_id: 1,
    title: "title",
    showing: 1,
    genre: "Romance",
    release_date: "1999-12-18",
    end_date: "1999-12-18",
    registration_date: "2024-01-20",
    image_url: "assets/example.png",
  ),
  MyMovieListDummy(
    id: 2,
    user_id: 1,
    title: "title",
    showing: 0,
    genre: "Romance",
    release_date: "1999-12-18",
    end_date: "1999-12-18",
    registration_date: "2024-01-20",
    image_url: "assets/example.png",
  ),
  MyMovieListDummy(
    id: 3,
    user_id: 1,
    title: "title",
    showing: 1,
    genre: "Romance",
    release_date: "1999-12-18",
    end_date: "1999-12-18",
    registration_date: "2024-01-20",
    image_url: "assets/example.png",
  ),

  // 여기에 더 많은 무비를 추가할 수 있습니다.
];
