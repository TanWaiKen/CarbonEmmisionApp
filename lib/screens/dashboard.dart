import "package:carbon_emission/providers/bottom_nav_bar/bottom_nav_bar_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:carbon_emission/config/theme.dart";
import "package:carbon_emission/screens/home_screen.dart";
import "package:carbon_emission/screens/electricity_screen.dart";
import "package:carbon_emission/screens/transportation_screen.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashbaord extends ConsumerStatefulWidget {
  const Dashbaord({super.key});

  @override
  ConsumerState<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends ConsumerState<Dashbaord> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    TransportationScreen(),
    ElectricityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(bottomNavBarIndexProvider),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: secondaryGreen,
          ),

          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.car),
            label: "Transportation",
            backgroundColor: secondaryBlue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: "Electricity",
            backgroundColor: secondaryYellow,
          ),
        ],
        currentIndex: ref.watch(bottomNavBarIndexProvider),
        selectedLabelStyle: label(bold: true),
        onTap: (index) {
          ref.read(bottomNavBarIndexProvider.notifier).updateIndex(index);
        },
      ),
    );
  }
}
