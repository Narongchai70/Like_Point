import 'package:flutter/material.dart';

class BottomNavBarService extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarService({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color.fromARGB(255, 128, 33, 155),
            unselectedItemColor: Colors.grey.shade400,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home,size: 40,), label: 'Home',),
              BottomNavigationBarItem(
                icon: Icon(Icons.school,size: 40,),
                label: 'Champion',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,size: 40,),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,size: 40,),
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
