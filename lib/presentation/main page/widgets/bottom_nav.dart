import 'package:flutter/material.dart';

 ValueNotifier<int> IndexChangeNotiifer = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
   BottomNavigationBarWidget({super.key});

 

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: IndexChangeNotiifer,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            IndexChangeNotiifer.value = index;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined), label: 'Fast laugh'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.downloading), label: 'Downloads'),
          ],
        );
      },
    );
  }
}
