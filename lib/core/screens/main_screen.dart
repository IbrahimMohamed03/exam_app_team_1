
import 'package:exam_app_team_1/core/constants/app_colors.dart';
import 'package:exam_app_team_1/core/constants/media_query.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/screens/home_view.dart';
import '../../features/home/presentation/widgets/search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  late final List<Widget> screens = [
     HomeScreen(),
    Center(child: Text('Results')),
    Center(child: Text('Profile')),
    //TODO
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
          height: context.screenHeight*0.16,
          selectedIndex: selectedIndex,
          backgroundColor: AppColors.secondaryBackground,
          indicatorColor: AppColors.bottomBarSelectedColor,
          onDestinationSelected: (idx){
            setState(() {
              selectedIndex = idx;
            });
          },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Result',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}