import '../fc_exporter.dart';
import 'navbar/navbar_icon_data.dart';
import 'navbar/navbar_notifier.dart';

class HomeScreens extends ConsumerWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndex = ref.watch(selectedNavBarIndexProvider.state).state;

    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          fillColor: fcTransparent,
        );
      },
      duration: halfSeconds,
      child: navbarIcons[navBarIndex].bodyWidget,
    );
  }
}
