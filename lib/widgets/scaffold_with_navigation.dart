import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.navigationItems,
  });

  final Widget child;
  final int selectedIndex;
  final List<NavigationItem> navigationItems;

  @override
  Widget build(BuildContext context) {
    void onDestinationSelected(int index) =>
        context.go(navigationItems[index].path);

    if (MediaQuery.sizeOf(context).width > 600) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              destinations: [
                for (final item in navigationItems)
                  NavigationRailDestination(
                    icon: Icon(item.icon),
                    selectedIcon: item.selectedIcon != null
                        ? Icon(item.selectedIcon)
                        : null,
                    label: Text(item.label),
                  )
              ],
              extended: true,
            ),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          for (final item in navigationItems)
            NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon:
                  item.selectedIcon != null ? Icon(item.selectedIcon) : null,
              label: item.label,
            )
        ],
      ),
    );
  }
}

class NavigationItem {
  final String path;
  final WidgetBuilder body;
  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final List<RouteBase> routes;

  NavigationItem({
    required this.path,
    required this.body,
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.routes = const [],
  });
}
