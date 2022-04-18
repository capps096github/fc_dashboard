import '../fc_exporter.dart';

class FCDashboard extends StatelessWidget {
  const FCDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: fcRouterProvider.routeInformationParser,
      routerDelegate: fcRouterProvider.routerDelegate,
      theme: fcTheme,
      color: fcColor,
      title: "The Flutter Community Dashboard",
      debugShowCheckedModeBanner: false,
      restorationScopeId: fcId,
      // -- Scroll Behavior --
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        scrollbars: false,
      ),
    );
  }
}
