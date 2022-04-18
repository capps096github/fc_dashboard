import 'package:flutter/cupertino.dart';

import '../../fc_exporter.dart';

class NavbarIconData {
  final IconData selectedIcon, unselectedIcon;
  final String label, tooltip;

// this will be the widget rendered when the icon is clicked
  final Widget bodyWidget;

  NavbarIconData({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
    required this.tooltip,
    required this.bodyWidget,
  });
}

// list of NavbarIconData
final List<NavbarIconData> navbarIcons = [
  NavbarIconData(
    label: "Repositories",
    tooltip: "View a list of all Flutter Community Repositories",
    selectedIcon: CupertinoIcons.layers_alt_fill,
    unselectedIcon: CupertinoIcons.layers_alt,
    bodyWidget: const Repositories(),
  ),
  NavbarIconData(
    label: "Recent Activity",
    tooltip:
        "Check out a the recent activity on Flutter Community Repositories",
    selectedIcon: CupertinoIcons.graph_circle_fill,
    unselectedIcon: CupertinoIcons.graph_circle,
    bodyWidget: const Activity(),
  ),
  NavbarIconData(
    label: "About",
    tooltip: "View More about this app",
    selectedIcon: CupertinoIcons.question_circle_fill,
    unselectedIcon: CupertinoIcons.question_circle,
    bodyWidget: const AboutScreen(),
  ),
];
