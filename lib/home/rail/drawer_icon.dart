import 'package:flutter/cupertino.dart';

import '../../fc_exporter.dart';
import 'rail_provider.dart';

class DrawerIcon extends ConsumerWidget {
  const DrawerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // check if we are on Desktop
    // final isDesktop = CalcutResponsive.isDesktop(context);

    final colorScheme = Theme.of(context).colorScheme;
    final onPrimary = colorScheme.onPrimary;

    // isRailOpenProvider
    final isRailOpen = ref.watch(isRailOpenProvider.state).state;

    return Align(
      alignment: isRailOpen ? Alignment.topRight : Alignment.center,
      // padding: const EdgeInsets.only(bottom: 3),

      child: Material(
        color: fcTransparent,
        child: InkWell(
          splashColor: onPrimary,
          customBorder: const CircleBorder(),
          onTap: () {
            ref.watch(isRailOpenProvider.notifier).state =
                !ref.watch(isRailOpenProvider.state).state;
          },
          child: Ink(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: fcTransparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: AnimatedSwitcher(
              duration: quarterSeconds,
              child: isRailOpen
                  ? Icon(
                      Icons.arrow_back,
                      color: onPrimary,
                    )
                  : RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        CupertinoIcons.waveform,
                        color: onPrimary,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
