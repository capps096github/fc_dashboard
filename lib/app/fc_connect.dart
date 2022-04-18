
import '../fc_exporter.dart';
import 'fc_splash.dart';

///This widget is responsible for connecting the app
/// It checks if we are on the web, then it shows [CalcutSwagHome]
class FCConnect extends StatelessWidget {
  const FCConnect({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appSplash = ref.watch(appSplashProvider);

        return AnimatedSwitcher(
          duration: halfSeconds,
          child: appSplash.when(
              data: (_) {
                return const FCHome();
              },
              loading: () => const FCSplash(),
              error: (error, stackTrace) => ErrorWidget(error)),
        );
      },
    );
  }
}

final appSplashProvider = FutureProvider<dynamic>((ref) async {
  // Wait for two seconds splash screen
  return Future.delayed(oneSecond, () {
    return true;
  });
});
