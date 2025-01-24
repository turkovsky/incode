import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panda/screens/details/details_screen.dart';
import 'package:panda/screens/home/home_screen.dart';
import 'package:panda/screens/list/list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, GoRouterState state, StatefulNavigationShell shell) {
        return _ScaffoldNavBar(navigationShell: shell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (ctx, GoRouterState state) {
                return const HomeScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/list',
              builder: (ctx, GoRouterState state) => ListScreen(),
            )
          ],
        ),
      ],
    ),
    GoRoute(
        path: '/details',
        builder: (ctx, GoRouterState state) => const DetailsScreen()),
  ],
);

class _ScaffoldNavBar extends StatelessWidget {
  const _ScaffoldNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
