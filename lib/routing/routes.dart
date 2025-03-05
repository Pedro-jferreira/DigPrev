class AppRoutes {


  // quiz
  static const AppRoute quiz = AppRoute(
    path: '/quiz',
    name: 'quiz',
    appRoutes: <AppRoute>[section],
  );

  static const AppRoute section = AppRoute(
    path: 'section/:id',
    name: 'section',
  );

  //start
  static const AppRoute start = AppRoute(
      path: '/',
      name: 'start',
      appRoutes: <AppRoute>[login]
  );
  //login
  static const AppRoute login = AppRoute(
      path: '/login',
      name: 'login'
  );

  //relatorios
  static const AppRoute posts = AppRoute(path: '/posts', name: 'posts');

  // profile
  static const AppRoute profile = AppRoute(path: '/profile', name: 'profile');



  static final List<AppRoute> allRoutes =
    <AppRoute>[start, quiz, section, posts, profile];


}

class AppRoute {
  final String path;
  final String name;
  final List<AppRoute>? appRoutes;

  const AppRoute({
    required this.path,
    required this.name,
    this.appRoutes,
  });
}
