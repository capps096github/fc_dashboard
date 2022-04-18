import '../navbar/navbar_icon_data.dart';
import 'rail_item.dart';

List<RailItem> topRailItems = [
  ...navbarIcons.map((navbarIcon) => RailItem.fromNavbarIconData(navbarIcon)),
];
