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
    canPop: true,
  );

  static const AppRoute report = AppRoute(
    path: '/report',
    name: 'report',
    appRoutes: <AppRoute>[resultChart],
  );

  static const AppRoute resultChart = AppRoute(
    path: 'result/:id',
    name: 'resultChart',
    isScrollable: false,
    canPop: true,
  );
  static const AppRoute profile = AppRoute(path: '/profile', name: 'profile');

  //start
  static const AppRoute start = AppRoute(
    path: '/start',
    name: 'start',
    requiredLogin: false,
    appRoutes: <AppRoute>[login],
  );

  //login
  static const AppRoute login = AppRoute(
    path: '/login',
    requiredLogin: false,
    name: 'login',
  );

  static final List<AppRoute> allRoutes = <AppRoute>[
    start,
    quiz,
    section,
    report,
    profile,
    resultChart,
  ];

  static bool isScrollableForName(String name) {
    for (AppRoute route in allRoutes) {
      if (route.name == name && route.isScrollable == true) return true;
    }
    return false;
  }

  static bool requiredLogin(String path) {
    for (AppRoute route in allRoutes) {
      if (route.path == path && route.requiredLogin == true) return true;
    }
    return false;
  }

  static bool canPopForName(String name) {
    for (AppRoute route in allRoutes) {
      if (route.name == name && route.canPop == true) return true;
    }
    return false;
  }
}

class AppRoute {
  final String path;
  final String name;
  final bool isScrollable;
  final bool requiredLogin;
  final bool canPop;
  final List<AppRoute>? appRoutes;

  const AppRoute({
    required this.path,
    required this.name,
    this.requiredLogin = true,
    this.isScrollable = true,
    this.canPop = false,
    this.appRoutes,
  });
}
