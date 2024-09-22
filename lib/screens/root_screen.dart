import 'package:flutter/material.dart';
import 'package:quit_smoking/screens/hlep_me_screen.dart';
import 'package:quit_smoking/screens/home_screen.dart';
import 'package:quit_smoking/screens/settings_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller!.addListener(tabListener);
  }

  tabListener() {
    setState(() {

    });
  }

  @override
  dispose() {
    controller!.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: renderChildren(),
        ),
      ),
      bottomNavigationBar: renderBottomNavigation(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(),
      HlepMeScreen(),
      SettingsScreen(),
    ];
  }

  BottomNavigationBar renderBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller!.index,
      onTap: (int index) {
        setState(() {
          controller!.animateTo(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: '도우미',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
    );
  }
}
