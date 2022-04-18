import '../fc_exporter.dart';



final fcRouterProvider = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FCConnect(),
      routes: [
        // ither routes here

        //  ? --------- Auth ---------
        GoRoute(
          path: 'auth',
          builder: (context, state) => const AuthScreen(),
        ),

        // ? ----- Profile -----
        GoRoute(
          path: 'profile',
          builder: (context, state) => const UserProfile(),
        ),

        // ? ----- Repository -----
        GoRoute(
          name: 'repo',
          path: 'repo/:name',
          builder: (context, state) {
            final repoName = state.params['name']!;

            // use state.queryParams to get search query from query parameter
            final idString = state.queryParams['id']!;
            final repoId = int.parse(idString);

            return RepoDetails(githubRepoId: repoId, githubRepoName: repoName);
          },
        ),
      ],
    ),
  ],
// redirect to the auth page if the user is not logged in
  // add login logic here with stream builder that if user is null
// then we redirect to login page as initial route else we go to home page
  redirect: (state) {
    // current app user
    final _calcutUser = FirebaseAuth.instance.currentUser;

    // set the user logged in variable
    final _loggedIn = (_calcutUser != null);

    // if the user is not logged in, they need to login
    // final loggedIn = loginInfo.loggedIn;
    final loggingIn = (state.subloc == authPath);

    // if the user is not logged in, then we redirect to the login page
    // else don't redirect to any page since the user is on the login page
    if (!_loggedIn) {
      return loggingIn ? null : authPath;
    }

    // if the user is logged in but still on the login page, send them to
    // the home page
    if (loggingIn) return homePath;

    // no need to redirect at all
    return null;
  },

  // changes on the listenable will cause the router to refresh it's route
  refreshListenable: GoRouterRefreshStream(
    FirebaseAuth.instance.userChanges(),
  ),
  // turn off the # in the URLs on the web
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: initialLocation,
  //  here our firebase analytics observers
  observers: [
    // FirebaseAnalyticsObserver(analytics: _analytics),
  ],
  restorationScopeId: fcId,
  errorBuilder: (context, state) => ErrorWidget(state.error.toString()),
);
