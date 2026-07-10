import 'package:flutter/material.dart';
import 'package:sajilni/theme/app_colors.dart';
import 'package:sajilni/widgets/app_bottom_nav.dart';
import 'package:sajilni/widgets/app_drawer.dart';
import 'package:sajilni/screens/attendance_screen.dart';
import 'package:sajilni/screens/home_screen.dart';
import 'package:sajilni/screens/profile_screen.dart';
import 'package:sajilni/screens/reports_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  AppTab _tab = AppTab.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _tab.index,
        children: const [
          HomeScreen(),
          AttendanceScreen(),
          ReportsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        current: _tab,
        onChanged: (tab) => setState(() => _tab = tab),
      ),
    );
  }
}

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.title,
    required this.body,
    this.drawerStyle = DrawerStyle.dashboard,
    this.drawerActiveIndex = 0,
    this.leading,
    this.actions,
    this.floatingAction,
    this.bottomPadding = 24,
  });

  final String title;
  final Widget body;
  final DrawerStyle drawerStyle;
  final int drawerActiveIndex;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? floatingAction;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: AppDrawer(
        style: drawerStyle,
        activeIndex: drawerActiveIndex,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xCC0E1511),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            if (leading != null) leading!,
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           
          ],
        ),
        actions: actions,
      ),
      endDrawer: AppDrawer(
        style: drawerStyle,
        activeIndex: drawerActiveIndex,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(bottom: floatingAction != null ? 72 : bottomPadding),
              child: body,
            ),
          ),
          if (floatingAction != null)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: floatingAction!,
            ),
        ],
      ),
    );
  }
}
