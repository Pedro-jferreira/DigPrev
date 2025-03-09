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
    isScrollable: false,
  );

  //start
  static const AppRoute start = AppRoute(
      path: '/',
      name: 'start',
      requiredLogin: false,
      appRoutes: <AppRoute>[login]
  );
  //login
  static const AppRoute login = AppRoute(
      path: '/login',
      requiredLogin: false,
      name: 'login'
  );

  //relatorios
  static const AppRoute posts = AppRoute(path: '/posts', name: 'posts');

  // profile
  static const AppRoute profile = AppRoute(path: '/profile', name: 'profile');

  static final List<AppRoute> allRoutes = <AppRoute>[
    start,
    quiz,
    section,
    posts,
    profile,
  ];

  static bool isScrollableForName(String name) {
    return allRoutes
        .firstWhere(
          (AppRoute route) => route.name == name,
          orElse:
              () =>
                  const AppRoute(name: 'default', path: '', isScrollable: true),
        )
        .isScrollable;
  }

  static bool isAuthenticated(String path) {
    return allRoutes
        .firstWhere(
          (AppRoute route) => route.path == path,
      orElse:
          () =>
      const AppRoute(name: 'default', path: '', requiredLogin: true),
    )
    .requiredLogin;
  }
}

class AppRoute {
  final String path;
  final String name;
  final bool isScrollable;
  final bool requiredLogin;
  final List<AppRoute>? appRoutes;

  const AppRoute({
    required this.path,
    required this.name,
    this.requiredLogin = true,
    this.isScrollable = true,
    this.appRoutes,
  });
}
