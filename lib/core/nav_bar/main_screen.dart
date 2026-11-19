import 'package:exam_app_team_1/core/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  int _getCurrentIndex(String location){
    if (location == '/HomeScreen') return 0;
    // if (location == '/exams') return 1;
    if (location == '/Profile') return 2;

    return 0;
  }


  void _onTap(BuildContext context,int index){
    switch(index){
      case 0:
        context.go('/HomeScreen');
        break;
      case 2:
        context.go('/Profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(GoRouterState.of(context).uri.path);
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index)=>_onTap(context,index),
      ),
    );
  }
}