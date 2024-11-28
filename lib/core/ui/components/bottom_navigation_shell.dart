import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_extension.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationShell extends StatefulWidget {
  const BottomNavigationShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() => _BottomNavigationShellState();
}

class _BottomNavigationShellState extends State<BottomNavigationShell> {
  StatefulNavigationShell get navigationShell => widget.navigationShell;

  void _onNavigationItemTap(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedItemColor: Colors.purple[400],
        unselectedItemColor: Colors.purple[100],
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'navigation_item_label_home'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.newspaper),
            label: 'navigation_item_label_community'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: 'navigation_item_label_map'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label: 'navigation_item_label_chatting'.tr(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'navigation_item_label_my'.tr(context),
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: _onNavigationItemTap,
      ),
    );
  }
}
