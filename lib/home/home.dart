import '../fc_exporter.dart';

import 'appbar/home_appbar.dart';
import 'appbar/home_desktop_appbar.dart';
import 'home_navbar.dart';
import 'home_screens.dart';
import 'rail/navrail.dart';

final currentUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

class FCHome extends ConsumerWidget {
  const FCHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // app user
    final currentUser = ref.watch(currentUserProvider);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: currentUser.when(
        data: (User? user) {
          if (user == null) {
            return const AuthScreen();
          } else {
            return const Home();
          }
        },
        loading: () => const FCLogo(),
        error: (error, stackTrace) => ErrorWidget(error),
      ),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return FCResponsive(
      mobile: Scaffold(
        appBar: homeAppBar(context: context, ref: ref),
        body: const HomeScreens(),
        extendBody: true,
        bottomNavigationBar: const HomeNavBar(),
      ),

      // * desktop and tablet view
      desktop: Row(
        children: [
          // rail
          const HomeNavRail(),
          // body
          Expanded(
            child: Scaffold(
              appBar: homeDesktopAppBar(context: context, ref: ref),
              body: const HomeScreens(),
            ),
          ),
        ],
      ),
    );
  }
}
