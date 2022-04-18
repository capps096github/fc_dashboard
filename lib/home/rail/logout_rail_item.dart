import '../../fc_exporter.dart';
import 'leading_icon.dart';
import 'rail_item.dart';
import 'rail_provider.dart';

final _logoutRailItem = RailItem(
  label: "Logout",
  tooltip: "Logout",
  selectedIcon: Ionicons.log_out,
  unselectedIcon: Ionicons.log_out_outline,
  onTap: () async => await FirebaseAuth.instance.signOut(),
);

class LogoutRailItem extends ConsumerWidget {
  const LogoutRailItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // isRailOpenProvider
    final isRailOpen = ref.watch(isRailOpenProvider.state).state;

    //App Theme colorScheme
    final colorScheme = Theme.of(context).colorScheme;
    final onPrimary = colorScheme.onPrimary;
    final primary = colorScheme.primary;
    // secondary
    final secondary = colorScheme.secondary;

    final iconColor = onPrimary;
    const backgroundColor = fcError;

    // text style for the rail item
    final railTextStyle = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 17,
      color: iconColor,
    );

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Tooltip(
        message: _logoutRailItem.tooltip,
        textStyle: TextStyle(color: primary),
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: AnimatedSwitcher(
          duration: quarterSeconds,
          child: isRailOpen
              ? ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: _logoutRailItem.onTap,
                  leading: LeadingIcon(
                    iconColor: iconColor,
                    icon: _logoutRailItem.selectedIcon,
                  ),
                  title: Text(
                    _logoutRailItem.label,
                    style: railTextStyle,
                    maxLines: 1,
                  ),
                  trailing: Icon(
                    Ionicons.open_outline,
                    color: iconColor,
                  ),
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: _logoutRailItem.onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LeadingIcon(
                      iconColor: iconColor,
                      icon: _logoutRailItem.unselectedIcon,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
